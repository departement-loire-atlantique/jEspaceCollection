
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class Links__1 {

    @SerializedName("self")
    @Expose
    private Self__1 self;
    @SerializedName("kpk:field")
    @Expose
    private KpkField kpkField;

    public Self__1 getSelf() {
        return self;
    }

    public void setSelf(Self__1 self) {
        this.self = self;
    }

    public KpkField getKpkField() {
        return kpkField;
    }

    public void setKpkField(KpkField kpkField) {
        this.kpkField = kpkField;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Links__1 .class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("self");
        sb.append('=');
        sb.append(((this.self == null)?"<null>":this.self));
        sb.append(',');
        sb.append("kpkField");
        sb.append('=');
        sb.append(((this.kpkField == null)?"<null>":this.kpkField));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
