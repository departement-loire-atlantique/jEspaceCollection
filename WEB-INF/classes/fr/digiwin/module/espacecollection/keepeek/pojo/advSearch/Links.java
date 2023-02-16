
package fr.digiwin.module.espacecollection.keepeek.pojo.advSearch;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class Links {

    @SerializedName("self")
    @Expose
    private Self self;
    @SerializedName("curies")
    @Expose
    private List<Cury> curies;
    @SerializedName("kpk:medias")
    @Expose
    private KpkMedias kpkMedias;

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

    public KpkMedias getKpkMedias() {
        return kpkMedias;
    }

    public void setKpkMedias(KpkMedias kpkMedias) {
        this.kpkMedias = kpkMedias;
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
        sb.append("kpkMedias");
        sb.append('=');
        sb.append(((this.kpkMedias == null)?"<null>":this.kpkMedias));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
