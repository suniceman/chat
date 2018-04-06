package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.BigGroup;

public interface BigGroupMapper {
    
    List<BigGroup> findBigGroupByUserId(int userId);
    
}
