
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class MediaLight {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("permission")
    @Expose
    private String permission;
    @SerializedName("mediaType")
    @Expose
    private String mediaType;
    @SerializedName("fileSize")
    @Expose
    private Integer fileSize;
    @SerializedName("fileSizeString")
    @Expose
    private String fileSizeString;
    @SerializedName("updateDate")
    @Expose
    private String updateDate;
    @SerializedName("duplicationStatus")
    @Expose
    private String duplicationStatus;
    @SerializedName("thumbnailGenerationStatus")
    @Expose
    private String thumbnailGenerationStatus;
    @SerializedName("_links")
    @Expose
    private LinksMediaResult links;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getMediaType() {
        return mediaType;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public Integer getFileSize() {
        return fileSize;
    }

    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileSizeString() {
        return fileSizeString;
    }

    public void setFileSizeString(String fileSizeString) {
        this.fileSizeString = fileSizeString;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getDuplicationStatus() {
        return duplicationStatus;
    }

    public void setDuplicationStatus(String duplicationStatus) {
        this.duplicationStatus = duplicationStatus;
    }

    public String getThumbnailGenerationStatus() {
        return thumbnailGenerationStatus;
    }

    public void setThumbnailGenerationStatus(String thumbnailGenerationStatus) {
        this.thumbnailGenerationStatus = thumbnailGenerationStatus;
    }

    public LinksMediaResult getLinks() {
        return links;
    }

    public void setLinks(LinksMediaResult links) {
        this.links = links;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(MediaLight.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("id");
        sb.append('=');
        sb.append(((this.id == null)?"<null>":this.id));
        sb.append(',');
        sb.append("title");
        sb.append('=');
        sb.append(((this.title == null)?"<null>":this.title));
        sb.append(',');
        sb.append("permission");
        sb.append('=');
        sb.append(((this.permission == null)?"<null>":this.permission));
        sb.append(',');
        sb.append("mediaType");
        sb.append('=');
        sb.append(((this.mediaType == null)?"<null>":this.mediaType));
        sb.append(',');
        sb.append("fileSize");
        sb.append('=');
        sb.append(((this.fileSize == null)?"<null>":this.fileSize));
        sb.append(',');
        sb.append("fileSizeString");
        sb.append('=');
        sb.append(((this.fileSizeString == null)?"<null>":this.fileSizeString));
        sb.append(',');
        sb.append("updateDate");
        sb.append('=');
        sb.append(((this.updateDate == null)?"<null>":this.updateDate));
        sb.append(',');
        sb.append("duplicationStatus");
        sb.append('=');
        sb.append(((this.duplicationStatus == null)?"<null>":this.duplicationStatus));
        sb.append(',');
        sb.append("thumbnailGenerationStatus");
        sb.append('=');
        sb.append(((this.thumbnailGenerationStatus == null)?"<null>":this.thumbnailGenerationStatus));
        sb.append(',');
        sb.append("links");
        sb.append('=');
        sb.append(((this.links == null)?"<null>":this.links));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
