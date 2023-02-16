package fr.digiwin.module.espacecollection.keepeek;

import org.apache.log4j.Logger;

import fr.digiwin.module.espacecollection.keepeek.pojo.Media;
import fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum;

public class KeepeekUtil {

    private static final Logger LOGGER = Logger.getLogger(KeepeekUtil.class);
    
    public static Metadatum getMediaMetadata(Media media, String idMetadata) {
        return media.getEmbedded().getMetadata()
                .stream()
                .filter(it -> idMetadata.equalsIgnoreCase(it.getId()))
                .findFirst()
                .orElse(null);
    }
}