package fr.digiwin.module.espacecollection.keepeek;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.util.Util;

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
        return Util.isEmpty(media) || Util.isEmpty(idMetadata) ? null : getMetadataById(media.getEmbedded(), idMetadata);
    }
    
    public static Metadatum getMediaMetadata(MediaLight media, String idMetadata) {
        return Util.isEmpty(media) || Util.isEmpty(idMetadata) ? null : getMetadataById(media.getEmbedded(), idMetadata);
    }
    
    public static int getNbResultsByPage() {
        return Channel.getChannel().getIntegerProperty(KeepeekConst.NB_RESULT_BY_PAGE_PROP, 60);
    }
}