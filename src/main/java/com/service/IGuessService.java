package com.service;

import com.entity.Guess;

import java.util.List;

public interface IGuessService {
    Integer addGuess(Guess guess);
    Integer deleteGuess(Integer id);
    List<Guess> findGuessByUserId(Integer user_id);
}
