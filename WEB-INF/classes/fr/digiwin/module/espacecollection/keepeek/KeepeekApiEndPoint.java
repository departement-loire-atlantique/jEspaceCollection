package fr.digiwin.module.espacecollection.keepeek;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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

    public static SearchResult searchMedia(String text, KeepeekSearchQuery searchQuery, String sort, int page,
            int size) {

        StringBuilder params = new StringBuilder();

        // default filter
        params.append("fq=folderId:22&");// 22 => Fiches objets de collections
//        params.append("f=metamodelId:4&");// 4 => 1. Fiches objets de collections KO

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
        String params = "type=thesaurus&";
        
        if(Util.notEmpty(idThesaurus)) {
            params += "thesaurusId=" + idThesaurus + "&";
        }
        
        if(Util.notEmpty(text)) {
            params += "q=" + HttpUtil.encodeForURL(text);
        }
        
        try {
            String strAutocomplete = KeepeekApiManager.getEndPoint("api/dam/search/autocomplete?" + params);

            GsonBuilder gsonBuild = new GsonBuilder();

            Gson gson = gsonBuild.create();

            LOGGER.warn(strAutocomplete);
            AutocompleteThesaurus autocomplete = gson.fromJson(strAutocomplete, AutocompleteThesaurus.class);
            return autocomplete;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }
}
