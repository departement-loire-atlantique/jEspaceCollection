package fr.digiwin.module.espacecollection.keepeek;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jalios.jcms.Channel;
import com.jalios.jcms.HttpUtil;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.deserializer.EmbeddedResultDeserializer;
import fr.digiwin.module.espacecollection.keepeek.deserializer.EmbeddedThesaurusTreeDeserializer;
import fr.digiwin.module.espacecollection.keepeek.exception.KeepeekException;
import fr.digiwin.module.espacecollection.keepeek.pojo.AutocompleteThesaurus;
import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedResult;
import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedThesaurusTree;
import fr.digiwin.module.espacecollection.keepeek.pojo.Media;
import fr.digiwin.module.espacecollection.keepeek.pojo.SearchResult;
import fr.digiwin.module.espacecollection.keepeek.pojo.ThesaurusTree;
import fr.digiwin.module.espacecollection.keepeek.pojo.advSearch.NewAdvSearch;
import fr.digiwin.module.espacecollection.keepeek.search.KeepeekSearchQuery;
import fr.digiwin.module.espacecollection.keepeek.search.adv.KeepeekAdvSearchQuery;

public class KeepeekApiEndPoint {

    private static final Logger LOGGER = Logger.getLogger(KeepeekApiEndPoint.class);

    public static Media getMedia(String idMedia) {
        try {
            String strMedia = KeepeekApiManager.getEndPoint("api/dam/medias/" + idMedia);
            Gson gson = new Gson();
            Media media = gson.fromJson(strMedia, Media.class);
            return media;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }

    public static SearchResult searchMedia(String text, KeepeekSearchQuery searchQuery) {
        return searchMedia(text, searchQuery, "creationDate desc", 1, 20);
    }

    public static SearchResult searchMedia(String text, KeepeekSearchQuery searchQuery, int page, int size) {
        return searchMedia(text, searchQuery, "creationDate desc", page, size);
    }

    /**
     * Dans les media uniquement les champs : id,title,_embedded{metadata.byId(datation,numero_dinventaire)}
     * @param text
     * @param searchQuery
     * @param sort
     * @param page
     * @param size
     * @return
     */
    public static SearchResult searchMedia(String text, KeepeekSearchQuery searchQuery, String sort, int page,
            int size) {

        StringBuilder params = new StringBuilder("forceArrays=true&");

        // default filter
        params.append("f=bloc_note:10828&");// 10828 => espace collections
        params.append("f=subStatusId:2&");// 2 => Interne
        
        // selection des champs
        params.append("fields=id,title,_embedded%7Bmetadata.byId(datation,numero_dinventaire)%7D&");

        if (Util.notEmpty(text)) {
            params.append("q=").append(HttpUtil.encodeForURL(text)).append("&");
        }

        // build "f" param
        if (Util.notEmpty(searchQuery)) {
            String query = searchQuery.build();
            if (Util.notEmpty(query)) {
                params.append(query).append("&");
            }
        }

        if (Util.notEmpty(sort)) {
            params.append("sort=").append(HttpUtil.encodeForURL(sort)).append("&");
        }
        if (Util.notEmpty(page)) {
            params.append("page=").append(page).append("&");
        }
        if (Util.notEmpty(size)) {
            params.append("size=").append(size).append("&");
        }

        try {
            String strSearchResult = KeepeekApiManager.getEndPoint("api/dam/search/media?" + params);

            GsonBuilder gsonBuild = new GsonBuilder();
            gsonBuild.registerTypeAdapter(EmbeddedResult.class, new EmbeddedResultDeserializer());

            Gson gson = gsonBuild.create();

            SearchResult result = gson.fromJson(strSearchResult, SearchResult.class);

            return result;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }
        return null;
    }

    public static SearchResult advSearchMedia(String id) {
        return advSearchMedia(id, "creationDate desc", 1, 20);
    }

    public static SearchResult advSearchMedia(String id, int page, int size) {
        return advSearchMedia(id, "creationDate desc", page, size);
    }

    public static SearchResult advSearchMedia(String id, String sort, int page, int size) {
        if (Util.isEmpty(id)) {
            return null;
        }

        StringBuilder params = new StringBuilder("forceArrays=true&");
        
        // selection des champs
        params.append("fields=id,title,_embedded%7Bmetadata.byId(datation,numero_dinventaire)%7D&");

        if (Util.notEmpty(sort)) {
            params.append("sort=").append(HttpUtil.encodeForURL(sort)).append("&");
        }
        if (Util.notEmpty(page)) {
            params.append("page=").append(page).append("&");
        }
        if (Util.notEmpty(size)) {
            params.append("size=").append(size).append("&");
        }

        try {
            String strSearchResult = KeepeekApiManager.getEndPoint("api/dam/search/advanced/" + id + "/media?" + params);

            GsonBuilder gsonBuild = new GsonBuilder();
            gsonBuild.registerTypeAdapter(EmbeddedResult.class, new EmbeddedResultDeserializer());

            Gson gson = gsonBuild.create();

            SearchResult result = gson.fromJson(strSearchResult, SearchResult.class);

            return result;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }
        return null;
    }

    public static ThesaurusTree getThesaurusTree(String idThesaurus) {
        try {
            String strThesaurusTree = KeepeekApiManager.getEndPoint("api/dam/thesaurus-tree/" + idThesaurus);

            GsonBuilder gsonBuild = new GsonBuilder();
            gsonBuild.registerTypeAdapter(EmbeddedThesaurusTree.class, new EmbeddedThesaurusTreeDeserializer());

            Gson gson = gsonBuild.create();

            ThesaurusTree thesaurusTree = gson.fromJson(strThesaurusTree, ThesaurusTree.class);
            return thesaurusTree;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }

    public static AutocompleteThesaurus getAutocompleteThesaurus(String idThesaurus, String text) {
        String params = "forceArrays=true&type=thesaurus&";

        if (Util.notEmpty(idThesaurus)) {
            params += "thesaurusId=" + idThesaurus + "&";
        }

        if (Util.notEmpty(text)) {
            params += "q=" + HttpUtil.encodeForURL(text);
        }

        try {
            String strAutocomplete = KeepeekApiManager.getEndPoint("api/dam/search/autocomplete?" + params);

            GsonBuilder gsonBuild = new GsonBuilder();

            Gson gson = gsonBuild.create();

            AutocompleteThesaurus autocomplete = gson.fromJson(strAutocomplete, AutocompleteThesaurus.class);
            return autocomplete;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }

    public static NewAdvSearch createAdvancedSearch(KeepeekAdvSearchQuery advSearch) {

        HttpSession session = Channel.getChannel().getCurrentServletRequest().getSession();
        if (Util.notEmpty(session)) {
            String idAdvSearch = Util.getString(session.getAttribute(KeepeekConst.SESSION_ATR_ADV_SEARCH_ID), "");
            if (Util.notEmpty(idAdvSearch)) {
                // TODO delete cache ???
                try {
                    KeepeekApiManager.deleteEndPoint("api/dam/search/advanced/"+idAdvSearch);
                } catch (KeepeekException e) {
                    LOGGER.error(e.getLocalizedMessage(), e);
                }
            }
        }

        if (advSearch.isEmpty()) {
            return null; // TODO
        }

        JsonArray filters = advSearch.build();

        // default filter
        
        // 10828 => espace collections
        JsonObject filterBlocNote = new JsonObject();
        filterBlocNote.addProperty("internalFieldName", "bloc_note");
        filterBlocNote.addProperty("modifier", "CONTAINS_ONE");
        filterBlocNote.addProperty("showSub", true);
        filterBlocNote.addProperty("type", "THESAURUSFIELD");
        filterBlocNote.addProperty("fieldType", "METAFIELD");
        JsonArray values = new JsonArray();
        values.add(10828);
        filterBlocNote.add("values", values);

        filters.add(filterBlocNote);
        
        // 2 => Interne
        JsonObject filterStatus = new JsonObject();
        filterStatus.addProperty("internalFieldName", "subStatusId");
        filterStatus.addProperty("type", "STATUSFIELD");
        filterStatus.addProperty("fieldType", "MEDIAFIELD");
        JsonArray valuesStatus = new JsonArray();
        valuesStatus.add(2);
        filterStatus.add("values", valuesStatus);

        filters.add(filterStatus);
        
        // END def filter

        // build body
        JsonObject filterBody = new JsonObject();
        JsonObject embedded = new JsonObject();
        embedded.add("filter", filters);
        filterBody.add("_embedded", embedded);

        try {
            String newAdvSearchStr = KeepeekApiManager.postEndPoint("api/dam/search/advanced", filterBody.toString());

            GsonBuilder gsonBuild = new GsonBuilder();

            Gson gson = gsonBuild.create();

            NewAdvSearch newAdvSearch = gson.fromJson(newAdvSearchStr, NewAdvSearch.class);

            session.setAttribute(KeepeekConst.SESSION_ATR_ADV_SEARCH_ID, newAdvSearch.getId());

            return newAdvSearch;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }
}
