package com.zs.service.impl;

import com.zs.bean.Singer;
import com.zs.mapper.SingerMapper;
import com.zs.mapper.UserMapper;
import com.zs.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SingerServiceImpl implements SingerService {

    @Autowired
    private SingerMapper singerMapper;
    @Override
    public List<Singer> selectAllSinger() {
        return singerMapper.selectAllSinger();
    }

    @Override
    public void insertSinger(String sName) {
        singerMapper.insertSinger(sName);
    }

    @Override
    public Singer selectSingerById(Integer sId) {
        return singerMapper.selectSingerById(sId);
    }

    @Override
    public List<Singer> selectASingerByUId(Integer uId) {
        return singerMapper.selectASingerByUId(uId);
    }

    @Override
    public List<Singer> selectSingerByLetter(String tagName) {
        return singerMapper.selectSingerByLetter(tagName);
    }

    @Override
    public List<Singer> selectSingerByRegion(String tagName) {
        return singerMapper.selectSingerByRegion(tagName);
    }

    @Override
    public List<Singer> selectSingerBySex(String tagName) {
        return singerMapper.selectSingerBySex(tagName);
    }

    @Override
    public List<Singer> selectSingerByStyle(String tagName) {
        return singerMapper.selectSingerByStyle(tagName);
    }
}
