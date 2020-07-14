package com.zs.service.impl;

import com.zs.bean.Song;
import com.zs.bean.SongList;
import com.zs.mapper.SongListMapper;
import com.zs.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongListServiceImpl implements SongListService {

    @Autowired
    SongListMapper songListMapper;

    @Override
    public void insertSongList(SongList songList) {
        songListMapper.insertSongList(songList);
    }

    @Override
    public List<SongList> selectAllSongList() {
        return songListMapper.selectAllSongList();
    }

    @Override
    public void insertSongInList(Integer songId, Integer lId) {
        songListMapper.insertSongInList(songId,lId);
    }

    @Override
    public List<SongList> selectSongListByUId(Integer uId) {
        return songListMapper.selectSongListByUId(uId);
    }

    @Override
    public SongList selectSongListBylId(Integer lId) {
        return songListMapper.selectSongListBylId(lId);
    }

    @Override
    public List<Song> selectSongDateByLId(Integer lId) {
        return songListMapper.selectSongDateByLId(lId);
    }

    @Override
    public void insertLike(Integer uId) {
        songListMapper.insertLike(uId);
    }

    @Override
    public void doInsertSongToSongList(Integer lId, Integer songId) {
        songListMapper.doInsertSongToSongList(lId,songId);
    }

    @Override
    public void doDeleteSongToSongList(Integer lId, Integer songId) {
        songListMapper.doDeleteSongToSongList(lId,songId);
    }

    @Override
    public List<SongList> selectSongListByFindName(String findName) {
        return songListMapper.selectSongListByFindName(findName);
    }

    @Override
    public void updateListenNum(Integer lId,Integer num) {
        songListMapper.updateListenNum(lId,num);
    }

    @Override
    public void updateSongListSongNum(Integer tempLId,Integer songNum) {
        songListMapper.updateSongListSongNum(tempLId,songNum);
    }

    @Override
    public Integer selectSongNum(Integer tempLId) {
        return songListMapper.selectSongNum(tempLId);
    }

    @Override
    public List<SongList> selectSongListByTId(Integer tId) {
        return songListMapper.selectSongListByTId(tId);
    }

    @Override
    public void deleteSongList(Integer lId) {
        songListMapper.deleteSongList(lId);
    }

    @Override
    public Integer selectCollectNum(String name) {
        return songListMapper.selectCollectNum(name);
    }

}
