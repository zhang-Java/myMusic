package com.zs.service;

import com.zs.bean.Singer;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface SingerService {

    List<Singer> selectAllSinger();

    void insertSinger(String sName);

    Singer selectSingerById(Integer sId);

    List<Singer> selectASingerByUId(Integer uId);

    List<Singer> selectSingerByLetter(String tagName);

    List<Singer> selectSingerByRegion(String tagName);

    List<Singer> selectSingerBySex(String tagName);

    List<Singer> selectSingerByStyle(String tagName);

}
