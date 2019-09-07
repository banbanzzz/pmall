package com.mapper;

import com.entity.Guess;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuessMapper {
    Integer addGuess(Guess guess);
    Integer deleteGuess(Integer id);
    List<Guess> findGuessByUserId(Integer user_id);
    Integer removeGuess(@Param("user_id") Integer user_id,@Param("goods_id") Integer goods_id);
    Guess findGuessByUser(@Param("user_id") Integer user_id,@Param("goods_id") Integer goods_id);
}
