package fr.digiwin.module.espacecollection.keepeek.alarm;

import java.text.ParseException;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.jcms.ChannelListener;
import com.jalios.jdring.AlarmEntry;
import com.jalios.jdring.AlarmListener;
import com.jalios.jdring.AlarmManager;
import com.jalios.jdring.PastDateException;
import com.jalios.jdring.Schedule;
import com.jalios.util.JProperties;
import com.jalios.util.JPropertiesListener;
import com.jalios.util.Util;

/**
 * 
 */
public class KeepeekFilterChannelListenner extends ChannelListener implements JPropertiesListener {

    private static final Logger LOGGER = Logger.getLogger(KeepeekFilterChannelListenner.class);
    private static final Channel CHANNEL = Channel.getChannel();

    private static final String ALARM_MGR_NAME = "KeepeekFilterAlarm";

    private static Schedule SCHEDULE = null;  

    private void initAlarmListener() {

        // Supprime les précédentes alarmes enregistrées
        AlarmManager alarmMgr = CHANNEL.getAlarmManager(ALARM_MGR_NAME);
        if(Util.notEmpty(alarmMgr.getAllAlarms()) ){
            alarmMgr.removeAllAlarms();
            LOGGER.info("Remove KeepeekFilterAlarm");            
        }

        // Propriété configurée pour la planification
        String scheduleProperty = CHANNEL.getProperty("jcmsplugin.espacecollection.recherche.filtre.Keepeek.get.schedule");

        // Une planification existe (on enregistre l'alarme même si elle est invalide)
        if ( Util.notEmpty(scheduleProperty) ){
            try {
                // Parse la plannification pour s'assurer de sa validité
                SCHEDULE = Schedule.parse(scheduleProperty);

            } catch (ParseException ex) {
                LOGGER.error("Syntaxe de planification incorrecte '" + scheduleProperty + "' (jcmsplugin.espacecollection.recherche.filtre.Keepeek.get.schedule). Utilisation de la planification par défaut.");
                // Utilise une planification par défaut sinon
                SCHEDULE = new Schedule(00, 05, -1, -1, -1, -1); // 00 05 * * * *
            }       

            // Enregistre la nouvelle alarme
            try {
                AlarmListener alarmListener = new KeepeekFilterAlarmListener();
                AlarmEntry alarmEntry = new AlarmEntry(SCHEDULE, alarmListener);
                alarmMgr.addAlarm(alarmEntry);

                LOGGER.info("Register ldapAlarm. Next update: " + alarmEntry.toString());           

            } catch (PastDateException e) {
                LOGGER.error("Exception while scheduling AlarmListener", e);
            }
        }
    }

    @Override
    public void initAfterStoreLoad() throws Exception {
        initAlarmListener();
    }

    @Override
    public void propertiesChange(JProperties p) {
        boolean isScheduleUpdated = SCHEDULE != null 
                && !(Util.isSameContent(SCHEDULE.format(), p.getProperty("jcmsplugin.espacecollection.recherche.filtre.Keepeek.get.schedule", null)));

        if( isScheduleUpdated ){
            initAlarmListener();            
        }
    }

    @Override
    public void handleFinalize() {
        // TODO Auto-generated method stub
    }

    @Override
    public void initBeforeStoreLoad() throws Exception {
        // TODO Auto-generated method stub
    }

}
