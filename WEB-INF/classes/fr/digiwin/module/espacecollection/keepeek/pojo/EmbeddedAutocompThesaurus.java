
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;

import fr.digiwin.module.espacecollection.keepeek.deserializer.EmbeddedAutocompThesaurusAdapter;

@Generated("jsonschema2pojo")
public class EmbeddedAutocompThesaurus {

    @SerializedName("thesaurus")
    @JsonAdapter(EmbeddedAutocompThesaurusAdapter.class)
    @Expose
    private List<Thesauru> thesaurus;

    public List<Thesauru> getThesaurus() {
        return thesaurus;
    }

    public void setThesaurus(List<Thesauru> thesaurus) {
        this.thesaurus = thesaurus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Embedded.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("thesaurus");
        sb.append('=');
        sb.append(((this.thesaurus == null)?"<null>":this.thesaurus));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
