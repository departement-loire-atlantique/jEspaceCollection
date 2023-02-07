
package fr.digiwin.module.espacecollection.keepeek.pojo;

import java.util.List;
import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class Embedded {

    @SerializedName("metadata")
    @Expose
    private List<Metadatum> metadata;
    @SerializedName("importUser")
    @Expose
    private ImportUser importUser;
    @SerializedName("updateUser")
    @Expose
    private UpdateUser updateUser;

    public List<Metadatum> getMetadata() {
        return metadata;
    }

    public void setMetadata(List<Metadatum> metadata) {
        this.metadata = metadata;
    }

    public ImportUser getImportUser() {
        return importUser;
    }

    public void setImportUser(ImportUser importUser) {
        this.importUser = importUser;
    }

    public UpdateUser getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(UpdateUser updateUser) {
        this.updateUser = updateUser;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Embedded.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("metadata");
        sb.append('=');
        sb.append(((this.metadata == null)?"<null>":this.metadata));
        sb.append(',');
        sb.append("importUser");
        sb.append('=');
        sb.append(((this.importUser == null)?"<null>":this.importUser));
        sb.append(',');
        sb.append("updateUser");
        sb.append('=');
        sb.append(((this.updateUser == null)?"<null>":this.updateUser));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
