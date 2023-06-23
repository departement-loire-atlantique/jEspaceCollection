package fr.digiwin.module.espacecollection.keepeek;

import java.util.List;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.util.Util;

import fr.digiwin.module.espacecollection.keepeek.pojo.Embedded;
import fr.digiwin.module.espacecollection.keepeek.pojo.Media;
import fr.digiwin.module.espacecollection.keepeek.pojo.MediaLight;
import fr.digiwin.module.espacecollection.keepeek.pojo.Metadatum;

public class KeepeekUtil {

    private static final Logger LOGGER = Logger.getLogger(KeepeekUtil.class);
    
    public static Metadatum getMetadataById(List<Metadatum> metadatas, String idMetadata) {
        return Util.isEmpty(metadatas) ? null : metadatas.stream()
                .filter(it -> idMetadata.equalsIgnoreCase(it.getId()))
                .findFirst()
                .orElse(null);
    }
    
    public static Metadatum getMediaMetadata(Media media, String idMetadata) {
        if(Util.isEmpty(media) || Util.isEmpty(idMetadata)) {
            return null;
        }
        return Util.isEmpty(media.getEmbedded()) ? null : getMetadataById(media.getEmbedded().getMetadata(), idMetadata);
    }
    
    public static Metadatum getMediaMetadata(MediaLight media, String idMetadata) {
        if(Util.isEmpty(media) || Util.isEmpty(idMetadata)) {
            return null;
        }
        return Util.isEmpty(media.getEmbedded()) ? null : getMetadataById(media.getEmbedded().getMetadata(), idMetadata);
    }
    
    public static int getNbResultsByPage() {
        return Channel.getChannel().getIntegerProperty(KeepeekConst.NB_RESULT_BY_PAGE_PROP, 60);
    }
}