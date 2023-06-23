
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class LinksMediaResult {

    @SerializedName("self")
    @Expose
    private Self__1 self;
    @SerializedName("kpk:large")
    @Expose
    private KpkLarge kpkLarge;
    @SerializedName("kpk:medium")
    @Expose
    private KpkMedium kpkMedium;
    @SerializedName("preview")
    @Expose
    private Preview preview;
    @SerializedName("kpk:small")
    @Expose
    private KpkSmall kpkSmall;
    @SerializedName("kpk:whr")
    @Expose
    private KpkWhr kpkWhr;
    @SerializedName("kpk:xlarge")
    @Expose
    private KpkXlarge kpkXlarge;
    @SerializedName("kpk:custom-status")
    @Expose
    private Self__1 kpkCustomStatus;

    public Self__1 getSelf() {
        return self;
    }

    public void setSelf(Self__1 self) {
        this.self = self;
    }

    public KpkLarge getKpkLarge() {
        return kpkLarge;
    }

    public void setKpkLarge(KpkLarge kpkLarge) {
        this.kpkLarge = kpkLarge;
    }

    public KpkMedium getKpkMedium() {
        return kpkMedium;
    }

    public void setKpkMedium(KpkMedium kpkMedium) {
        this.kpkMedium = kpkMedium;
    }

    public Preview getPreview() {
        return preview;
    }

    public void setPreview(Preview preview) {
        this.preview = preview;
    }

    public KpkSmall getKpkSmall() {
        return kpkSmall;
    }

    public void setKpkSmall(KpkSmall kpkSmall) {
        this.kpkSmall = kpkSmall;
    }

    public KpkWhr getKpkWhr() {
        return kpkWhr;
    }

    public void setKpkWhr(KpkWhr kpkWhr) {
        this.kpkWhr = kpkWhr;
    }

    public KpkXlarge getKpkXlarge() {
        return kpkXlarge;
    }

    public void setKpkXlarge(KpkXlarge kpkXlarge) {
        this.kpkXlarge = kpkXlarge;
    }

    public Self__1 getKpkCustomStatus() {
        return kpkCustomStatus;
    }

    public void setKpkCustomStatus(Self__1 kpkCustomStatus) {
        this.kpkCustomStatus = kpkCustomStatus;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Links__1 .class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("self");
        sb.append('=');
        sb.append(((this.self == null)?"<null>":this.self));
        sb.append(',');
        sb.append("kpkLarge");
        sb.append('=');
        sb.append(((this.kpkLarge == null)?"<null>":this.kpkLarge));
        sb.append(',');
        sb.append("kpkMedium");
        sb.append('=');
        sb.append(((this.kpkMedium == null)?"<null>":this.kpkMedium));
        sb.append(',');
        sb.append("preview");
        sb.append('=');
        sb.append(((this.preview == null)?"<null>":this.preview));
        sb.append(',');
        sb.append("kpkSmall");
        sb.append('=');
        sb.append(((this.kpkSmall == null)?"<null>":this.kpkSmall));
        sb.append(',');
        sb.append("kpkWhr");
        sb.append('=');
        sb.append(((this.kpkWhr == null)?"<null>":this.kpkWhr));
        sb.append(',');
        sb.append("kpkXlarge");
        sb.append('=');
        sb.append(((this.kpkXlarge == null)?"<null>":this.kpkXlarge));
        sb.append(',');
        sb.append("kpkCustomStatus");
        sb.append('=');
        sb.append(((this.kpkCustomStatus == null)?"<null>":this.kpkCustomStatus));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
