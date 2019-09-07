package com.service.imp;

import com.entity.Memory;
import com.mapper.MemoryMapper;
import com.service.IMemoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MemoryServiceImp implements IMemoryService {
    @Autowired
    private MemoryMapper memoryMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public Memory findMemoryById(Integer id) {
        return memoryMapper.findMemoryById(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Memory> findAllMemory() {
        return memoryMapper.findAllMemory();
    }
}
