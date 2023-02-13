package fr.digiwin.module.espacecollection.keepeek.deserializer;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import fr.digiwin.module.espacecollection.keepeek.pojo.Thesauru;

public class EmbeddedAutocompThesaurusAdapter implements JsonDeserializer<List<Thesauru>> {

    @Override
    public List<Thesauru> deserialize(JsonElement json, Type type, JsonDeserializationContext ctx)
            throws JsonParseException {
        List<Thesauru> result;

        if (json.isJsonArray()) {
            result = ctx.deserialize(json, type);
        } else {
            result = new ArrayList<>();
            result.add(ctx.deserialize(json, Thesauru.class));
        }
        return result;
    }
}
