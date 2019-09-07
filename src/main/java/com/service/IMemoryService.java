package com.service;

import com.entity.Memory;

import java.util.List;

public interface IMemoryService {
    Memory findMemoryById(Integer id);
    List<Memory> findAllMemory();
}
