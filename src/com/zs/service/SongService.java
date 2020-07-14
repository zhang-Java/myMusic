package com.zs.service;

import com.zs.bean.Album;
import com.zs.bean.Song;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface SongService {

    void insertSong(Song song);

    List<Song> selectSongBySId(Integer sId);

    List<Song> selectAllSong();

    List<Song> selectSongByRegion(String region1,String region2);

    List<Song> selectSongByAId(Integer aId);

    Song selectSongBySongId(Integer songId);

    List<Song> selectSongByFindName(String findName);

}
