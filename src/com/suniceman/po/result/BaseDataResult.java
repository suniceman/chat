package com.suniceman.po.result;

import java.util.List;

import com.suniceman.po.BigGroup;
import com.suniceman.po.FriendGroup;
import com.suniceman.po.StatusUser;

public class BaseDataResult {
    public StatusUser getMine() {
        return mine;
    }
    
    public void setMine(StatusUser mine) {
        this.mine = mine;
    }
    
    public List<FriendGroup> getFriend() {
        return friend;
    }
    
    public void setFriend(List<FriendGroup> friend) {
        this.friend = friend;
    }
    
    public List<BigGroup> getGroup() {
        return group;
    }
    
    public void setGroup(List<BigGroup> group) {
        this.group = group;
    }
    
    private StatusUser mine;
    private List<FriendGroup> friend;
    private List<BigGroup> group;
}
