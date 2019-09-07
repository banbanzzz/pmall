package com.mapper;

import com.entity.GoodsType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsTypeMapper {
    GoodsType findTypeById(Integer type_id);
    Integer addGoodsType(GoodsType type);
    Integer deleteGoodsType(Integer type_id);
    Integer updateGoodsType(GoodsType type);
    Integer ChangeTypeState(@Param("state") Integer state,@Param("id") Integer id);
    List<GoodsType> findAllType();
    List<GoodsType> findAllTypeByLikeName(String name);
    List<GoodsType> findAllBySplitPage();
}
