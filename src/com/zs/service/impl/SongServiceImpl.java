package com.zs.service.impl;

import com.zs.bean.Song;
import com.zs.mapper.SongMapper;
import com.zs.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongServiceImpl implements SongService {

    @Autowired
    private SongMapper songMapper;

    @Override
    public void insertSong(Song song) {
        songMapper.insertSong(song);
    }

    @Override
    public List<Song> selectSongBySId(Integer sId) {
        return songMapper.selectSongBySId(sId);
    }

    @Override
    public List<Song> selectAllSong() {
        return songMapper.selectAllSong();
    }

    @Override
    public List<Song> selectSongByRegion(String region1,String region2) {
        return songMapper.selectSongByRegion(region1,region2);
    }

    @Override
    public List<Song> selectSongByAId(Integer aId) {
        return songMapper.selectSongByAId(aId);
    }

    @Override
    public Song selectSongBySongId(Integer songId) {
        return songMapper.selectSongBySongId(songId);
    }

    @Override
    public List<Song> selectSongByFindName(String findName) {
        return songMapper.selectSongByFindName(findName);
    }
}
