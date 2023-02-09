package fr.digiwin.module.espacecollection.keepeek.deserializer;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;

import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedResult;
import fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight;

public class EmbeddedResultDeserializer implements JsonDeserializer<EmbeddedResult> {

    @Override
    public EmbeddedResult deserialize(JsonElement jsonElem, Type type, JsonDeserializationContext ctx)
            throws JsonParseException {
        JsonObject embeddedResultObj = jsonElem.getAsJsonObject();
        Gson gson = new Gson();
        EmbeddedResult embeddedResult = gson.fromJson(jsonElem, EmbeddedResult.class);
        List<MediaLight> values = null;
        if (embeddedResultObj.get("media").isJsonArray()) {
            values = gson.fromJson(embeddedResultObj.get("media"), new TypeToken<List<MediaLight>>() {
            }.getType());
        } else {
            MediaLight single = gson.fromJson(embeddedResultObj.get("media"), MediaLight.class);
            values = new ArrayList<MediaLight>();
            values.add(single);
        }
        embeddedResult.setMedias(values);
        return embeddedResult;
    }

}
