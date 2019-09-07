package com.mapper;

import com.entity.Funs;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FunsMapper {
    Funs findFunsById(Integer id);
    List<Funs> findFunsByPid(Integer pid);
    List<Funs> findAllFuns();
    List<Funs> findFunsByRoleId(Integer role_id);
}
