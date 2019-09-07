package com.mapper;

import com.entity.Address;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AddressMapper {
    Integer addAddress(Address address);
    Integer updateAddress(Address address);
    Integer deleteAddress(Integer addr_id);
    Integer changeAddrState(@Param("state") Integer state,@Param("id") Integer id);
    Address findAddrById(Integer id);
    List<Address> findAddrByUserId(Integer user_id);
}
