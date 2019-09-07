package com.service.imp;

import com.entity.Guess;
import com.mapper.GuessMapper;
import com.service.IGuessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class GuessServiceImp implements IGuessService {
    @Autowired
    private GuessMapper guessMapper;

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addGuess(Guess guess) {
        return guessMapper.addGuess(guess);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteGuess(Integer id) {
        return guessMapper.deleteGuess(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer removeGuess(Integer user_id, Integer goods_id) {
        return guessMapper.removeGuess(user_id, goods_id);
    }

    @Override
    public Guess findGuessByUser(Integer user_id, Integer goods_id) {
        return guessMapper.findGuessByUser(user_id, goods_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Guess> findGuessByUserId(Integer user_id) {
        return guessMapper.findGuessByUserId(user_id);
    }
}
