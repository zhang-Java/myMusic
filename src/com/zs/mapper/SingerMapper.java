package com.zs.mapper;

import com.zs.bean.Singer;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface SingerMapper {

    List<Singer> selectAllSinger();

    @Insert("insert into singer values(null,#{sName},'中国','男','L','流行',10,10,10,10,'无',0,'/resource/img/singer/singer(0).jpg')")
    void insertSinger(String sName);

    Singer selectSingerById(Integer sId);

    List<Singer> selectASingerByUId(Integer uId);

    List<Singer> selectSingerByLetter(String tagName);

    List<Singer> selectSingerByRegion(String tagName);

    List<Singer> selectSingerBySex(String tagName);

    List<Singer> selectSingerByStyle(String tagName);

}
