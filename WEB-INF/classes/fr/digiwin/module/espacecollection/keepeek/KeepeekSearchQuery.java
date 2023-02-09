package fr.digiwin.module.espacecollection.keepeek;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;

import com.jalios.jcms.HttpUtil;
import com.jalios.util.Util;

public class KeepeekSearchQuery {

    private static final Logger LOGGER = Logger.getLogger(KeepeekSearchQuery.class);

    private Map<String, List<String>> queryMap = new HashMap<>();

    public KeepeekSearchQuery() {

    }

    public void add(String key, String val) {
        List<String> vals;
        if (this.queryMap.containsKey(key)) {
            vals = this.queryMap.get(key);
        } else {
            vals = new ArrayList<String>();
            this.queryMap.put(key, vals);
        }
        
        vals.add(val);
    }

    /**
     * 
     * @return f=key1:val1&f=key1:val2&f=key2:val1
     */
    public String build() {
        String query = "";
        if (Util.notEmpty(this.queryMap)) {
            List<String> queryList = this.queryMap.entrySet()
                    .stream()
                    .map(entry -> entry.getValue()
                            .stream()
                            .map(val -> entry.getKey() + ":" + val)
                            .collect(Collectors.toList()))
                    .flatMap(List::stream)
                    .collect(Collectors.toList());
            query = queryList
                    .stream()
                    .map(s -> "f=" + HttpUtil.encodeForURL(s))
                    .collect(Collectors.joining("&"));
        }
        return query;
    }
    
    public boolean isEmpty() {
        return Util.isEmpty(this.queryMap);
    }
}
