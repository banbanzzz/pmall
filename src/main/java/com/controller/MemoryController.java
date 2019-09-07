package com.controller;

import com.entity.Memory;
import com.service.IMemoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/memory")
public class MemoryController {
    @Autowired
    private IMemoryService memoryService;

    @RequestMapping("findAll")
    @ResponseBody
    public List<Memory> findAllMemory(){
        return memoryService.findAllMemory();
    }
}
