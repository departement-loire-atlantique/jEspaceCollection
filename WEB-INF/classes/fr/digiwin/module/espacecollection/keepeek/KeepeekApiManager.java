package fr.digiwin.module.espacecollection.keepeek;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jalios.jcms.Channel;
import com.jalios.util.HttpClientUtils;

import fr.digiwin.module.espacecollection.keepeek.exception.KeepeekException;
import fr.digiwin.module.espacecollection.keepeek.pojo.Media;

public class KeepeekApiManager {

    private static final Logger LOGGER = Logger.getLogger(KeepeekApiManager.class);
    private static final String PROP_API_URL = "jcmsplugin.espacecollection.keepeek.url";
    private static final String PROP_LOGIN = "jcmsplugin.espacecollection.keepeek.login";
    private static final String PROP_PWD = "jcmsplugin.espacecollection.keepeek.password";

    private static String getKeepeekLogin() {
        return Channel.getChannel().getProperty(PROP_LOGIN);
    }

    private static String getKeepeekPwd() {
        return Channel.getChannel().getProperty(PROP_PWD);
    }

    public static String getUrl(String url) throws KeepeekException {
        String token = getKeepeekLogin() + ":" + getKeepeekPwd();
        String base64Token = Base64.getEncoder().encodeToString(token.getBytes());

        CloseableHttpClient httpClient = HttpClientUtils.newHttpClient();
        HttpGet httpGet = new HttpGet(url);
        httpGet.addHeader("Authorization", "Basic " + base64Token);

        try {
            CloseableHttpResponse response = httpClient.execute(httpGet);
            int statusCode = response.getStatusLine().getStatusCode();

            String strResponse = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);

            if (statusCode != 200) {
                JsonObject json = new JsonObject().getAsJsonObject(strResponse);
                throw new KeepeekException(json.get("message").getAsString(), json.get("status").getAsInt());
            }

            return strResponse;
        } catch (IOException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }

    public static Media getMedia(String idMedia) {
        try {
            String strMedia = getUrl("api/dam/medias/" + idMedia);
            Gson gson = new Gson();
            Media media = gson.fromJson(strMedia, Media.class);
            return media;
        } catch (KeepeekException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
        }

        return null;
    }
}
