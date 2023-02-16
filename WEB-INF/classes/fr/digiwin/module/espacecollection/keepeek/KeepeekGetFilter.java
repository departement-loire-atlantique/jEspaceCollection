package fr.digiwin.module.espacecollection.keepeek;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.ControllerStatus;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.pojo.ChildThesaurusTree;
import fr.digiwin.module.espacecollection.keepeek.pojo.ThesaurusTree;

public class KeepeekGetFilter {

    private static final Logger LOGGER = Logger.getLogger(KeepeekGetFilter.class);

    public Category root;

    public KeepeekGetFilter() {

    }

    public void process() {
        LOGGER.info("Start process get filters");
        this.root = Channel.getChannel().getCategory(KeepeekConst.PROP_ID_FILTRE_ROOT);

        if (Util.isEmpty(this.root)) {
            // TODO error
            return;
        }

        Map<Category, Integer> subRoot = this.finAllSubRoot();
        LOGGER.trace(subRoot);

        subRoot.forEach((cat, deep) -> this.syncProcess(cat, deep));
        LOGGER.info("End process get filters");
    }

    private void syncProcess(Category cat, Integer deep) {
        String rechercehKey = Util.getFirst(cat.getSynonyms());
        String idThesaurus = cat.getDescription();
        if (Util.notEmpty(rechercehKey) && Util.notEmpty(idThesaurus)) {

            ThesaurusTree thesaurusTree = KeepeekApiEndPoint.getThesaurusTree(idThesaurus);
            if (thesaurusTree == null) {
                // TODO log error
                LOGGER.error("Error find for " + idThesaurus);
                return;
            }

            Set<Category> noPreces = new HashSet<>(cat.getChildrenSet());
            Set<Category> process = new HashSet<>();

            if (thesaurusTree.getEmbeddedThesaurusTree() != null
                    && thesaurusTree.getEmbeddedThesaurusTree().getChildThesaurusTree() != null) {
                LOGGER.trace("child for " + idThesaurus);

                Map<String, Category> mappingThesaurusIdToCat = new HashMap<>();
                mappingThesaurusIdToCat = cat.getChildrenSet()
                        .stream()
                        .filter(c -> Util.notEmpty(c.getDescription()))
                        .collect(Collectors.toMap(c -> c.getDescription(), c -> c));

                for (ChildThesaurusTree itThesaurusChild : thesaurusTree.getEmbeddedThesaurusTree()
                        .getChildThesaurusTree()) {
                    Category catProcess = this.createOrUpdateCat(mappingThesaurusIdToCat, cat,
                            itThesaurusChild.getTitle(),
                            itThesaurusChild.getId() + "");
                    if (catProcess != null) {
                        noPreces.remove(catProcess);
                        process.add(catProcess);
                    }
                }
            }

            for (Category itCatNoProcess : noPreces) {
                ControllerStatus status = itCatNoProcess
                        .checkAndPerformDelete(Channel.getChannel().getDefaultAdmin());
                if (status.hasFailed()) {
                    LOGGER.error("Error dellete cat : " + status.getMessage(Channel.getChannel().getLanguage()));
                }
            }

            // process subcatProcess test
            if (deep < (KeepeekConst.MAX_DEEP_FILTER - 1)) {
                process.forEach(itCat -> this.syncProcess(itCat, deep + 1));
            }
        }
    }

    private Map<Category, Integer> finAllSubRoot() {
        Map<Category, Integer> subRoot = new HashMap<>();
        this.root.getChildrenSet().forEach(itCat -> {
            if (Util.notEmpty(itCat.getDescription())) {
                subRoot.put(itCat, 1);
            } else {
                Map<Category, Integer> itCatChildOk = itCat.getChildrenSet()
                        .stream()
                        .filter(c -> Util.notEmpty(c.getDescription()))
                        .collect(Collectors.toMap(c -> c, c -> new Integer(2)));
                if (Util.notEmpty(itCatChildOk)) {
                    subRoot.putAll(itCatChildOk);
                }
            }
        });
        return subRoot;
    }

    private Category createOrUpdateCat(Map<String, Category> mappingThesaurusIdToCat, Category parent, String title,
            String idThesaurus) {
        Category cat = null;
        if (mappingThesaurusIdToCat.containsKey(idThesaurus)) {
            cat = mappingThesaurusIdToCat.get(idThesaurus);
            if (!cat.getName().equals(title)) {
                Category updateCat = (Category) cat.getUpdateInstance();
                updateCat.setName(title);
                ControllerStatus status = updateCat.checkAndPerformUpdate(Channel.getChannel().getDefaultAdmin());
                if (status.hasFailed()) {
                    LOGGER.error("Error update name cat : " + status.getMessage(Channel.getChannel().getLanguage()));
                }
            }
        } else {
            cat = new Category();
            cat.setName(title);
            cat.setSynonyms((String[]) ArrayUtils.clone(parent.getSynonyms()));
            cat.setDescription(idThesaurus);
            cat.setParent(parent);

            ControllerStatus status = cat.checkAndPerformCreate(Channel.getChannel().getDefaultAdmin());
            if (status.hasFailed()) {
                LOGGER.error("Error create cat : " + status.getMessage(Channel.getChannel().getLanguage()));
                cat = null;
            }
        }
        return cat;
    }

}
