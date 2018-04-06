package com.suniceman.service;

import java.util.List;

import com.suniceman.po.BigGroup;

public interface BigGroupService {
    List<BigGroup> findBigGroupByUserId(int userId);
}
