package fr.digiwin.module.espacecollection;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.util.Util;

public abstract class CollectionUtil {

    private static final Logger LOGGER = Logger.getLogger(CollectionUtil.class);
    
    /**
     * ! pas plus de 2 de profondeur par rapport à root
     * @return
     */
    public static List<Category> finAllSubRootSearch() {
        List<Category> subRoot = new ArrayList<>();

        Category root = Channel.getChannel().getCategory("$jcmsplugin.espacecollection.recherche.filtre.Keepeek.root");
        if(Util.isEmpty(root)) {
            return subRoot;
        }
        root.getChildrenSet().forEach(itCat -> {
            if (Util.notEmpty(itCat.getDescription())) {
                subRoot.add(itCat);
            } else {
                List<Category> itCatChildOk = itCat.getChildrenSet()
                        .stream()
                        .filter(c -> Util.notEmpty(c.getDescription()))
                        .collect(Collectors.toList());
                if (Util.notEmpty(itCatChildOk)) {
                    subRoot.addAll(itCatChildOk);
                }
            }
        });
        return subRoot;
    }
}