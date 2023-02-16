
package fr.digiwin.module.espacecollection.keepeek.pojo;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

@Generated("jsonschema2pojo")
public class Media {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("status")
    @Expose
    private String status;
    @SerializedName("permission")
    @Expose
    private String permission;
    @SerializedName("downloadLevel")
    @Expose
    private String downloadLevel;
    @SerializedName("annotation")
    @Expose
    private String annotation;
    @SerializedName("width")
    @Expose
    private Integer width;
    @SerializedName("height")
    @Expose
    private Integer height;
    @SerializedName("resolution")
    @Expose
    private Integer resolution;
    @SerializedName("mediaType")
    @Expose
    private String mediaType;
    @SerializedName("fileSize")
    @Expose
    private Integer fileSize;
    @SerializedName("fileSizeString")
    @Expose
    private String fileSizeString;
    @SerializedName("originalFileName")
    @Expose
    private String originalFileName;
    @SerializedName("creationDate")
    @Expose
    private String creationDate;
    @SerializedName("updateDate")
    @Expose
    private String updateDate;
    @SerializedName("importDate")
    @Expose
    private String importDate;
    @SerializedName("duration")
    @Expose
    private String duration;
    @SerializedName("durationInSeconds")
    @Expose
    private Integer durationInSeconds;
    @SerializedName("duplicationStatus")
    @Expose
    private String duplicationStatus;
    @SerializedName("thumbnailGenerationStatus")
    @Expose
    private String thumbnailGenerationStatus;
    @SerializedName("checkSums")
    @Expose
    private CheckSums checkSums;
    @SerializedName("mediaLinkCount")
    @Expose
    private Integer mediaLinkCount;
    @SerializedName("formType")
    @Expose
    private String formType;
    @SerializedName("_links")
    @Expose
    private Links links;
    @SerializedName("_embedded")
    @Expose
    private Embedded embedded;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getDownloadLevel() {
        return downloadLevel;
    }

    public void setDownloadLevel(String downloadLevel) {
        this.downloadLevel = downloadLevel;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getResolution() {
        return resolution;
    }

    public void setResolution(Integer resolution) {
        this.resolution = resolution;
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

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public Integer getDurationInSeconds() {
        return durationInSeconds;
    }

    public void setDurationInSeconds(Integer durationInSeconds) {
        this.durationInSeconds = durationInSeconds;
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

    public CheckSums getCheckSums() {
        return checkSums;
    }

    public void setCheckSums(CheckSums checkSums) {
        this.checkSums = checkSums;
    }

    public Integer getMediaLinkCount() {
        return mediaLinkCount;
    }

    public void setMediaLinkCount(Integer mediaLinkCount) {
        this.mediaLinkCount = mediaLinkCount;
    }

    public String getFormType() {
        return formType;
    }

    public void setFormType(String formType) {
        this.formType = formType;
    }

    public Links getLinks() {
        return links;
    }

    public void setLinks(Links links) {
        this.links = links;
    }

    public Embedded getEmbedded() {
        return embedded;
    }

    public void setEmbedded(Embedded embedded) {
        this.embedded = embedded;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Media.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("id");
        sb.append('=');
        sb.append(((this.id == null)?"<null>":this.id));
        sb.append(',');
        sb.append("title");
        sb.append('=');
        sb.append(((this.title == null)?"<null>":this.title));
        sb.append(',');
        sb.append("status");
        sb.append('=');
        sb.append(((this.status == null)?"<null>":this.status));
        sb.append(',');
        sb.append("permission");
        sb.append('=');
        sb.append(((this.permission == null)?"<null>":this.permission));
        sb.append(',');
        sb.append("downloadLevel");
        sb.append('=');
        sb.append(((this.downloadLevel == null)?"<null>":this.downloadLevel));
        sb.append(',');
        sb.append("annotation");
        sb.append('=');
        sb.append(((this.annotation == null)?"<null>":this.annotation));
        sb.append(',');
        sb.append("width");
        sb.append('=');
        sb.append(((this.width == null)?"<null>":this.width));
        sb.append(',');
        sb.append("height");
        sb.append('=');
        sb.append(((this.height == null)?"<null>":this.height));
        sb.append(',');
        sb.append("resolution");
        sb.append('=');
        sb.append(((this.resolution == null)?"<null>":this.resolution));
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
        sb.append("originalFileName");
        sb.append('=');
        sb.append(((this.originalFileName == null)?"<null>":this.originalFileName));
        sb.append(',');
        sb.append("creationDate");
        sb.append('=');
        sb.append(((this.creationDate == null)?"<null>":this.creationDate));
        sb.append(',');
        sb.append("updateDate");
        sb.append('=');
        sb.append(((this.updateDate == null)?"<null>":this.updateDate));
        sb.append(',');
        sb.append("importDate");
        sb.append('=');
        sb.append(((this.importDate == null)?"<null>":this.importDate));
        sb.append(',');
        sb.append("duration");
        sb.append('=');
        sb.append(((this.duration == null)?"<null>":this.duration));
        sb.append(',');
        sb.append("durationInSeconds");
        sb.append('=');
        sb.append(((this.durationInSeconds == null)?"<null>":this.durationInSeconds));
        sb.append(',');
        sb.append("duplicationStatus");
        sb.append('=');
        sb.append(((this.duplicationStatus == null)?"<null>":this.duplicationStatus));
        sb.append(',');
        sb.append("thumbnailGenerationStatus");
        sb.append('=');
        sb.append(((this.thumbnailGenerationStatus == null)?"<null>":this.thumbnailGenerationStatus));
        sb.append(',');
        sb.append("checkSums");
        sb.append('=');
        sb.append(((this.checkSums == null)?"<null>":this.checkSums));
        sb.append(',');
        sb.append("mediaLinkCount");
        sb.append('=');
        sb.append(((this.mediaLinkCount == null)?"<null>":this.mediaLinkCount));
        sb.append(',');
        sb.append("formType");
        sb.append('=');
        sb.append(((this.formType == null)?"<null>":this.formType));
        sb.append(',');
        sb.append("links");
        sb.append('=');
        sb.append(((this.links == null)?"<null>":this.links));
        sb.append(',');
        sb.append("embedded");
        sb.append('=');
        sb.append(((this.embedded == null)?"<null>":this.embedded));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

}
