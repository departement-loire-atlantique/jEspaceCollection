package fr.digiwin.module.espacecollection.keepeek;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.exception.KeepeekException;
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

    public static SearchResult searchMedia(String text, Map<String, List<String>> queryMap) {
        return searchMedia(text, queryMap, "creationDate", 1, 20);
    }

    public static SearchResult searchMedia(String text, Map<String, List<String>> queryMap, String sort, int page,
            int size) {
        
        StringBuilder params = new StringBuilder();
        
        if(Util.notEmpty(text)) {
            params.append("q=").append(text).append("&");
        }

        // build "f" param
        if(Util.notEmpty(queryMap)) {
            List<String> queryList = queryMap.entrySet()
                    .stream()
                    .map(entry -> entry.getValue()
                            .stream()
                            .map(val -> entry.getKey() + ":" + val)
                            .collect(Collectors.toList()))
                    .flatMap(List::stream)
                    .collect(Collectors.toList());
            String query = queryList
                    .stream()
                    .map(s -> "f=" + s)
                    .collect(Collectors.joining("&"));
            if(Util.notEmpty(query)) {
                params.append(query).append("&");
            }
        }

        if(Util.notEmpty(sort)) {
            params.append("sort=").append(sort).append("&");
        }
        if(Util.notEmpty(page)) {
            params.append("page=").append(page).append("&");
        }
        if(Util.notEmpty(size)) {
            params.append("size=").append(size).append("&");
        }

        try {
            String strSearchResult = KeepeekApiManager.getEndPoint("api/dam/search/media?" + params);

            Gson gson = new Gson();
            SearchResult result = gson.fromJson(strSearchResult, SearchResult.class);

            return result;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }
        return null;
    }
}
