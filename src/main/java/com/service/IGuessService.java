package com.service;

import com.entity.Guess;

import java.util.List;

public interface IGuessService {
    Integer addGuess(Guess guess);
    Integer deleteGuess(Integer id);
    Integer removeGuess(Integer user_id,Integer goods_id);
    Guess findGuessByUser(Integer user_id,Integer goods_id);
    List<Guess> findGuessByUserId(Integer user_id);
}
