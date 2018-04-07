package com.suniceman.util.cache;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.ehcache.Cache;
import org.ehcache.CacheManager;

import com.suniceman.util.EHCacheUtil;

public class LayIMCache {
    private LayIMCache() {
    }
    
    private static LayIMCache _instance;
    
    // ����
    static final Lock instanceLock = new ReentrantLock();
    // �洢managerʵ��
    public static Map<String, CacheManager> CacheManagerContext = new ConcurrentHashMap<>();
    
    public static LayIMCache getInstance() {
        
        if (_instance == null) {
            instanceLock.lock();
            if (_instance == null) {
                _instance = new LayIMCache();
            }
            instanceLock.unlock();
        }
        return _instance;
    }
    
    final String HASHMAP_CONFIGURE = "HASHMAP_CONFIGURE";
    final String LIST_CONFIGURE = "LIST_CONFIGURE";
    
    private final EHCacheUtil cacheUtil = new EHCacheUtil();
    
    private <K, V> CacheManager getManager(Class<K> kClass, Class<V> vClass,
            String key) {
        
        if (CacheManagerContext.containsKey(key)) {
            return CacheManagerContext.get(key);
        }
        CacheManager manager = cacheUtil.getCacheManager(kClass, vClass, key);
        CacheManagerContext.put(key, manager);
        
        return manager;
    }
    
    private CacheManager getHashMapManager() {
        
        return getManager(String.class, Map.class, HASHMAP_CONFIGURE);
    }
    
    private CacheManager getListManager() {
        return getManager(String.class, List.class, LIST_CONFIGURE);
    }
    
    private Cache<String, List> getListCache(String cacheName) {
        CacheManager manager = getListManager();
        return cacheUtil.getCache(String.class, List.class, cacheName,
                LIST_CONFIGURE, manager);
    }
    
    private Cache<String, Map> getHashMapCache(String cacheName) {
        CacheManager manager = getHashMapManager();
        return cacheUtil.getCache(String.class, Map.class, cacheName,
                HASHMAP_CONFIGURE, manager);
    }
    
    /*
     * public void closeHashMapCache(){ CacheManager manager =
     * getHashMapManager(); cacheUtil.closeCache(manager,HASHMAP_CONFIGURE); }
     */
    
    public void set(String cacheName, String key, Map value) {
        Cache<String, Map> cache = getHashMapCache(cacheName);
        cache.put(key, value);
    }
    
    public Map get(String cacheName, String key) {
        Cache<String, Map> cache = getHashMapCache(cacheName);
        Map map = cache.get(key);
        return map;
    }
    
    public void setListCache(String cacheName, String key, List value) {
        Cache<String, List> cache = getListCache(cacheName);
        cache.put(key, value);
    }
    
    public List getListCache(String cacheName, String key) {
        Cache<String, List> cache = getListCache(cacheName);
        List list = cache.get(key);
        return list;
    }
}
