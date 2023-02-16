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

import fr.digiwin.module.espacecollection.keepeek.pojo.ChildThesaurusTree;
import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedResult;
import fr.digiwin.module.espacecollection.keepeek.pojo.EmbeddedThesaurusTree;
import fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight;

public class EmbeddedThesaurusTreeDeserializer implements JsonDeserializer<EmbeddedThesaurusTree> {

    @Override
    public EmbeddedThesaurusTree deserialize(JsonElement jsonElem, Type type, JsonDeserializationContext ctx)
            throws JsonParseException {
        JsonObject embeddedThesaurusTreeObj = jsonElem.getAsJsonObject();
        Gson gson = new Gson();
        EmbeddedThesaurusTree embeddedThesaurusTree = gson.fromJson(jsonElem, EmbeddedThesaurusTree.class);
        List<ChildThesaurusTree> values = null;
        if (embeddedThesaurusTreeObj.get("child").isJsonArray()) {
            values = gson.fromJson(embeddedThesaurusTreeObj.get("child"), new TypeToken<List<ChildThesaurusTree>>() {
            }.getType());
        } else {
            ChildThesaurusTree single = gson.fromJson(embeddedThesaurusTreeObj.get("child"), ChildThesaurusTree.class);
            values = new ArrayList<ChildThesaurusTree>();
            values.add(single);
        }
        embeddedThesaurusTree.setChildThesaurusTrees(values);
        return embeddedThesaurusTree;
    }

}
