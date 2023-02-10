
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class ThesaurusTree {

    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("_links")
    @Expose
    private LinksThesaurusTree links;
    @SerializedName("_embedded")
    @Expose
    private EmbeddedThesaurusTree embeddedThesaurusTree;
    @SerializedName("childrenCount")
    @Expose
    private Integer childrenCount;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LinksThesaurusTree getLinks() {
        return links;
    }

    public void setLinks(LinksThesaurusTree links) {
        this.links = links;
    }

    public EmbeddedThesaurusTree getEmbeddedThesaurusTree() {
        return embeddedThesaurusTree;
    }

    public void setEmbeddedThesaurusTree(EmbeddedThesaurusTree embeddedThesaurusTree) {
        this.embeddedThesaurusTree = embeddedThesaurusTree;
    }

    public Integer getChildrenCount() {
        return childrenCount;
    }

    public void setChildrenCount(Integer childrenCount) {
        this.childrenCount = childrenCount;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(ThesaurusTree.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("title");
        sb.append('=');
        sb.append(((this.title == null)?"<null>":this.title));
        sb.append(',');
        sb.append("links");
        sb.append('=');
        sb.append(((this.links == null)?"<null>":this.links));
        sb.append(',');
        sb.append("embeddedThesaurusTree");
        sb.append('=');
        sb.append(((this.embeddedThesaurusTree == null)?"<null>":this.embeddedThesaurusTree));
        sb.append(',');
        sb.append("childrenCount");
        sb.append('=');
        sb.append(((this.childrenCount == null)?"<null>":this.childrenCount));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
