
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class LinksSearchFilter {

    @SerializedName("kpk:removed-filter-search")
    @Expose
    private KpkRemovedFilterSearch kpkRemovedFilterSearch;

    public KpkRemovedFilterSearch getKpkRemovedFilterSearch() {
        return kpkRemovedFilterSearch;
    }

    public void setKpkRemovedFilterSearch(KpkRemovedFilterSearch kpkRemovedFilterSearch) {
        this.kpkRemovedFilterSearch = kpkRemovedFilterSearch;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Links__2 .class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("kpkRemovedFilterSearch");
        sb.append('=');
        sb.append(((this.kpkRemovedFilterSearch == null)?"<null>":this.kpkRemovedFilterSearch));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
