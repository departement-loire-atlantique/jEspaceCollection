package fr.digiwin.module.espacecollection.keepeek.deserializer;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import fr.digiwin.module.espacecollection.keepeek.pojo.Value;

public class ValuesAdapter implements JsonDeserializer<List<Value>> {

    @Override
    public List<Value> deserialize(JsonElement json, Type type, JsonDeserializationContext ctx)
            throws JsonParseException {
        List<Value> result;

        if (json.isJsonArray()) {
            result = ctx.deserialize(json, type);
        } else {
            result = new ArrayList<>();
            result.add((Value) ctx.deserialize(json, Value.class));
        }
        return result;
    }
}
