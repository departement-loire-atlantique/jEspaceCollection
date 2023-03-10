package fr.digiwin.module.espacecollection.keepeek;

import org.apache.log4j.Logger;

import fr.digiwin.module.espacecollection.keepeek.pojo.Embedded;
import fr.digiwin.module.espacecollection.keepeek.pojo.Media;
import fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight;
import fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum;

public class KeepeekUtil {

    private static final Logger LOGGER = Logger.getLogger(KeepeekUtil.class);
    
    private static Metadatum getMetadataById(Embedded embedded, String idMetadata) {
        return embedded.getMetadata()
                .stream()
                .filter(it -> idMetadata.equalsIgnoreCase(it.getId()))
                .findFirst()
                .orElse(null);
    }
    
    public static Metadatum getMediaMetadata(Media media, String idMetadata) {
        return getMetadataById(media.getEmbedded(), idMetadata);
    }
    
    public static Metadatum getMediaMetadata(MediaLight media, String idMetadata) {
        return getMetadataById(media.getEmbedded(), idMetadata);
    }
}