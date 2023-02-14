package fr.digiwin.module.espacecollection.keepeek;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;

public class KeepeekApiCache {

    private static final Logger LOGGER = Logger.getLogger(KeepeekApiCache.class);
    private static final String PROP_CACHE_DELAY = "jcmsplugin.espacecollection.keepeek.cache";
    
    private static KeepeekApiCache INSTANCE;
    
    private Map<String, Cache> caches;
    
    private KeepeekApiCache() {
        this.caches = new HashMap<>();
    }
    
    public static KeepeekApiCache getInstance() {
        if(INSTANCE == null) {
            INSTANCE = new KeepeekApiCache();
        }
        return INSTANCE;
    }
    
    public void add(String id, String rep) {
        this.add(id, new Date(), rep);
    }
    
    public void add(String id, Date date, String rep) {
        this.caches.put(id, new Cache(date, rep));
    }
    
    public void update(String id, String rep) {
        this.add(id, new Date(), rep);
    }
    
    public void update(String id, Date date, String rep) {
        this.add(id, date, rep);
    }
    
    public void remove(String id) {
        this.caches.remove(id);
    }
    
    public boolean isValid(String id, boolean remove) {
        if(!this.caches.containsKey(id)) {
            return false;
        }
        int cacheDelay = Channel.getChannel().getIntegerProperty(PROP_CACHE_DELAY, 30);
        
        Date actualDate = new Date();

        Long duration = TimeUnit.MILLISECONDS.toMinutes(actualDate.getTime() - this.caches.get(id).date.getTime());
        
        boolean isValid = duration <= cacheDelay;
        
        if(!isValid && remove) {
            this.remove(id);
        }
        
        return isValid;
    }
    
    public String getRep(String id) {
        if(!this.caches.containsKey(id)) {
            return null;
        }
        return this.caches.get(id).rep;
    }
    
    private class Cache {
        Date date;
        String rep;
        
        Cache(Date date, String rep){
            this.date = date;
            this.rep = rep;
        }
    }
}