
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;

import fr.digiwin.module.espacecollection.keepeek.deserializer.ValuesAdapter;

@Generated("jsonschema2pojo")
public class Embedded__1 {

    @SerializedName("value")
    @JsonAdapter(ValuesAdapter.class)
    @Expose
    private List<Value> values;

    public List<Value> getValue() {
        return values;
    }

    public void setValue(List<Value> values) {
        this.values = values;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Embedded__1 .class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("value");
        sb.append('=');
        sb.append(((this.values == null)?"<null>":this.values));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
