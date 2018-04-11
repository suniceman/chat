package com.suniceman.socket.manager;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.suniceman.po.User;
import com.suniceman.service.UserService;
import com.suniceman.service.impl.UserServiceImpl;
import com.suniceman.util.cache.LayIMCache;

public class GroupUserManager implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private static final String cacheName = "LAYIM_GROUP";
    private static final String cacheKey = "GM_";
    
    // 每个组存一个
    private String getCacheKey(int groupId) {
        return cacheKey + groupId;
    }
    
    // 将某个组的用户id存入缓存 key=》list
    public boolean saveGroupMemeberIds(int groupId, List<String> userIds) {
        String key = getCacheKey(groupId);
        LayIMCache.getInstance().setListCache(cacheName, key, userIds);
        return true;
    }
    
    public List<String> getGroupMembers(int groupId) {
        String key = getCacheKey(groupId);
        List<String> list = LayIMCache.getInstance().getListCache(cacheName,
                key);
        if (list == null || list.size() == 0) {
            System.out.println("缓存中没有数据，需要从数据库读取");
            UserService userService = new UserServiceImpl();
            List<User> userList = userService.findAll();
            List<String> memebers = new ArrayList<String>();
            for (User user : userList) {
                System.out.println(user.getId());
                memebers.add(user.getId() + "");
            }
            saveGroupMemeberIds(groupId, memebers);
            return memebers;
        } else {
            System.out.println("直接从缓存中读取出来");
        }
        return list;
    }
}
