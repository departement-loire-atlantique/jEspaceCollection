
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class EmbeddedThesaurusTree {

//    @SerializedName("child")
//    @Expose
    private List<ChildThesaurusTree> childThesaurusTree;

    public List<ChildThesaurusTree> getChildThesaurusTree() {
        return childThesaurusTree;
    }

    public void setChildThesaurusTrees(List<ChildThesaurusTree> childThesaurusTree) {
        this.childThesaurusTree = childThesaurusTree;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(EmbeddedThesaurusTree.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("childThesaurusTree");
        sb.append('=');
        sb.append(((this.childThesaurusTree == null)?"<null>":this.childThesaurusTree));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
