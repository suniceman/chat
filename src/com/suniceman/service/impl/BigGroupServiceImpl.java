package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.BigGroupMapper;
import com.suniceman.po.BigGroup;
import com.suniceman.service.BigGroupService;

@Service
public class BigGroupServiceImpl implements BigGroupService {
    
    @Autowired
    private BigGroupMapper bigGroupMapper;
    
    @Override
    public List<BigGroup> findBigGroupByUserId(int userId) {
        // TODO Auto-generated method stub
        return bigGroupMapper.findBigGroupByUserId(userId);
    }
    
}
