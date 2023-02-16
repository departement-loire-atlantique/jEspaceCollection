
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class SearchResult {

    @SerializedName("_links")
    @Expose
    private LinksSearchResult links;
    @SerializedName("_embedded")
    @Expose
    private EmbeddedResult embedded;
    @SerializedName("totalCount")
    @Expose
    private Integer totalCount;

    public LinksSearchResult getLinks() {
        return links;
    }

    public void setLinks(LinksSearchResult links) {
        this.links = links;
    }

    public EmbeddedResult getEmbeddedResult() {
        return embedded;
    }

    public void setEmbeddedResult(EmbeddedResult embedded) {
        this.embedded = embedded;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(SearchResult.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("links");
        sb.append('=');
        sb.append(((this.links == null)?"<null>":this.links));
        sb.append(',');
        sb.append("embedded");
        sb.append('=');
        sb.append(((this.embedded == null)?"<null>":this.embedded));
        sb.append(',');
        sb.append("totalCount");
        sb.append('=');
        sb.append(((this.totalCount == null)?"<null>":this.totalCount));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
