package fr.digiwin.module.espacecollection.keepeek;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.jalios.jcms.HttpUtil;

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

        // build "f" param
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

        //
        String param = "q=" + text + "&" + query + "&sort=" + sort + "&page=" + page + "&size=" + size;

        try {
            String strSearchResult = KeepeekApiManager.getEndPoint("api/dam/search/media?" + param);

            Gson gson = new Gson();
            SearchResult result = gson.fromJson(strSearchResult, SearchResult.class);

            return result;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }
        return null;
    }
}
