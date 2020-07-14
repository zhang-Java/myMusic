package com.zs.mapper;

import com.zs.bean.Song;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface SongMapper {

    @Insert("insert into song value (null,#{sId1},#{sId2},#{sId3},#{albumId},#{songName},#{sLong},#{time},#{lyric},#{messageNum},#{song_listenNum},#{mv});")
    void insertSong(Song song);

    List<Song> selectSongBySId(Integer sId);

    List<Song> selectAllSong();

    List<Song> selectSongByRegion(String songRegion1,String songRegion2);

    List<Song> selectSongByAId(Integer aId);

    Song selectSongBySongId(Integer songId);

    List<Song> selectSongByFindName(String findName);

}
