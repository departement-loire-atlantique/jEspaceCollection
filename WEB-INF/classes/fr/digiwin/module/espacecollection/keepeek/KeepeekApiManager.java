package fr.digiwin.module.espacecollection.keepeek;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jalios.jcms.Channel;
import com.jalios.util.HttpClientUtils;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.exception.KeepeekException;

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

    private static String getKeepeekUrl() {
        return Channel.getChannel().getProperty(PROP_API_URL);
    }

    private static String buildToken() {
        String token = getKeepeekLogin() + ":" + getKeepeekPwd();
        String base64Token = Base64.getEncoder().encodeToString(token.getBytes());

        return base64Token;
    }

    private static void testStatus(CloseableHttpResponse response, String strResponse) throws KeepeekException {
        int statusCode = response.getStatusLine().getStatusCode();
        if (statusCode < 200 || statusCode >=300) {
            JsonParser jsonParser = new JsonParser();
            JsonObject json = (JsonObject) jsonParser.parse(strResponse);
            String message = json.get("message") != null ? json.get("message").getAsString() : "??";
            int status = json.get("status") != null ? json.get("status").getAsInt() : -1;
            throw new KeepeekException(message, status);
        }
    }

    public static String getUrl(String url) throws KeepeekException {

        if (KeepeekApiCache.getInstance().isValid(url, true)) {
            return KeepeekApiCache.getInstance().getRep(url);
        }

        String base64Token = buildToken();

        CloseableHttpClient httpClient = HttpClientUtils.newHttpClient(20000);

        HttpGet httpGet = new HttpGet(url);
        httpGet.addHeader("Authorization", "Basic " + base64Token);

        try {
            CloseableHttpResponse response = httpClient.execute(httpGet);

            String strResponse = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);

            testStatus(response, strResponse);

            KeepeekApiCache.getInstance().add(url, strResponse);

            return strResponse;
        } catch (IOException e) {
//            LOGGER.error(e.getLocalizedMessage(), e);
            throw new KeepeekException(e.getLocalizedMessage(), e);
        }
    }

    public static String getEndPoint(String apiEndPoint) throws KeepeekException {
        return getUrl(getKeepeekUrl() + apiEndPoint);
    }

    public static String postUrl(String url, String body) throws KeepeekException {

        // TODO ?
//        if (KeepeekApiCache.getInstance().isValid(url, true)) {
//            return KeepeekApiCache.getInstance().getRep(url);
//        }

        String base64Token = buildToken();

        CloseableHttpClient httpClient = HttpClientUtils.newHttpClient(20000);

        HttpPost httpPost = new HttpPost(url);
        httpPost.addHeader("Authorization", "Basic " + base64Token);
        httpPost.addHeader("Content-Type", "application/json");
        
        try {
            HttpEntity entity = new StringEntity(body);
            httpPost.setEntity(entity);
            
            CloseableHttpResponse response = httpClient.execute(httpPost);

            String strResponse = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);

            testStatus(response, strResponse);

//            KeepeekApiCache.getInstance().add(url, strResponse);// TODO

            return strResponse;
        } catch (IOException e) {
//            LOGGER.error(e.getLocalizedMessage(), e);
            throw new KeepeekException(e.getLocalizedMessage(), e);
        }
    }

    public static String postEndPoint(String apiEndPoint, String body) throws KeepeekException {
        return postUrl(getKeepeekUrl() + apiEndPoint, body);
    }
    
    public static String deleteUrl(String url) throws KeepeekException {

        String base64Token = buildToken();

        CloseableHttpClient httpClient = HttpClientUtils.newHttpClient(20000);

        HttpDelete httpDelete = new HttpDelete(url);
        httpDelete.addHeader("Authorization", "Basic " + base64Token);
        
        try {            
            CloseableHttpResponse response = httpClient.execute(httpDelete);

            String strResponse = "{}";
            if(Util.notEmpty(response.getEntity())) {
                strResponse = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
            }

            testStatus(response, strResponse);

            return strResponse;
        } catch (IOException e) {
//            LOGGER.error(e.getLocalizedMessage(), e);
            throw new KeepeekException(e.getLocalizedMessage(), e);
        }
    }

    public static String deleteEndPoint(String apiEndPoint) throws KeepeekException {
        return deleteUrl(getKeepeekUrl() + apiEndPoint);
    }
}
