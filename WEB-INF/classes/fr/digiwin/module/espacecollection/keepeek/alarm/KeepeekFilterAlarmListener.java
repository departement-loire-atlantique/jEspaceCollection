package fr.digiwin.module.espacecollection.keepeek.alarm;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.jdring.AlarmEntry;
import com.jalios.jdring.AlarmListener;

import fr.digiwin.module.espacecollection.keepeek.KeepeekGetFilter;

/**
 * 
 * @author porhon
 */
public class KeepeekFilterAlarmListener implements AlarmListener {

    private static final Logger LOGGER = Logger.getLogger(KeepeekFilterAlarmListener.class);
    private static final Channel CHANNEL = Channel.getChannel();

    @Override
    public void handleAlarm(AlarmEntry alarmEntry) {
        KeepeekGetFilter filters = new KeepeekGetFilter();
        filters.process();
    }

}
