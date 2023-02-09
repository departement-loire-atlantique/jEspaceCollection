package fr.digiwin.module.espacecollection.keepeek;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jalios.jcms.HttpUtil;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.deserializer.EmbeddedResultDeserializer;
import fr.digiwin.module.espacecollection.keepeek.exception.KeepeekException;
import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedResult;
import fr.digiwin.module.espacecollection.keepeek.pojo.Media;
import fr.digiwin.module.espacecollection.keepeek.pojo.SearchResult;

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
}
