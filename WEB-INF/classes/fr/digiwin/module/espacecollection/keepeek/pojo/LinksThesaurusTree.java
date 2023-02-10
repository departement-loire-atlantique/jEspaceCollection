
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class LinksThesaurusTree {

    @SerializedName("self")
    @Expose
    private Self self;
    @SerializedName("curies")
    @Expose
    private List<Cury> curies;
    @SerializedName("kpk:thesaurus")
    @Expose
    private KpkThesaurus kpkThesaurus;

    public Self getSelf() {
        return self;
    }

    public void setSelf(Self self) {
        this.self = self;
    }

    public List<Cury> getCuries() {
        return curies;
    }

    public void setCuries(List<Cury> curies) {
        this.curies = curies;
    }

    public KpkThesaurus getKpkThesaurus() {
        return kpkThesaurus;
    }

    public void setKpkThesaurus(KpkThesaurus kpkThesaurus) {
        this.kpkThesaurus = kpkThesaurus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Links.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("self");
        sb.append('=');
        sb.append(((this.self == null)?"<null>":this.self));
        sb.append(',');
        sb.append("curies");
        sb.append('=');
        sb.append(((this.curies == null)?"<null>":this.curies));
        sb.append(',');
        sb.append("kpkThesaurus");
        sb.append('=');
        sb.append(((this.kpkThesaurus == null)?"<null>":this.kpkThesaurus));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
