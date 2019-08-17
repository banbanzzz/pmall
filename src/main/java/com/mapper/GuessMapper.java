package com.mapper;

import com.entity.Guess;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuessMapper {
    Integer addGuess(Guess guess);
    Integer deleteGuess(Integer id);
    List<Guess> findGuessByUserId(Integer user_id);
}
