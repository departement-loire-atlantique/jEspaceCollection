
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class EmbeddedResult {

//    @SerializedName("media")
//    @Expose
    private List<MediaLight> medias;
//    @SerializedName("selected-filter")
//    @Expose
    private List<SelectedFilter> selectedFilter;

    public List<MediaLight> getMedias() {
        return medias;
    }

    public void setMedias(List<MediaLight> media) {
        this.medias = media;
    }

    public List<SelectedFilter> getSelectedFilter() {
        return selectedFilter;
    }

    public void setSelectedFilter(List<SelectedFilter> selectedFilter) {
        this.selectedFilter = selectedFilter;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Embedded.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("media");
        sb.append('=');
        sb.append(((this.medias == null)?"<null>":this.medias));
        sb.append(',');
        sb.append("selectedFilter");
        sb.append('=');
        sb.append(((this.selectedFilter == null)?"<null>":this.selectedFilter));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
