package fr.digiwin.module.espacecollection.keepeek.search.adv;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jalios.util.Util;

public class KeepeekAdvSearchQuery {

    private static final Logger LOGGER = Logger.getLogger(KeepeekAdvSearchQuery.class);

    private List<Filter> filters;

    public KeepeekAdvSearchQuery() {
        this.filters = new ArrayList<>();
    }

    public void add(String key, EModifier modifier, String val) {
        this.filters.add(new Filter(key, modifier, val));
    }

    /**
     * 
     * @return jsonArray
     */
    public JsonArray build() {
        JsonArray jsonArray = new JsonArray();
        if (!this.isEmpty()) {
            this.filters.forEach(itFilter -> {
                jsonArray.add(itFilter.toJsonObj());
            });
        }
        return jsonArray;
    }

    public boolean isEmpty() {
        return Util.isEmpty(this.filters);
    }

    private class Filter {
        String internalFieldName;
        EModifier modifier;
        Boolean showSub = true;
        String type = "THESAURUSFIELD";
        String fieldType = "METAFIELD";
        String value;

        Filter(String internalFieldName, EModifier modifier, String value) {
            this.internalFieldName = internalFieldName;
            this.modifier = modifier;
            this.value = value;
        }

        JsonObject toJsonObj() {
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("internalFieldName", this.internalFieldName);
            jsonObject.addProperty("modifier", this.modifier.name());
            jsonObject.addProperty("showSub", this.showSub);
            jsonObject.addProperty("type", this.type);
            jsonObject.addProperty("fieldType", this.fieldType);

            // value
            JsonArray values = new JsonArray();
            try {
                values.add(Integer.parseInt(this.value));
            } catch (NumberFormatException e) {
                values.add(this.value);
            }
            jsonObject.add("values", values);


            return jsonObject;
        }
    }
}
