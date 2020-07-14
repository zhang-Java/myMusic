package com.zs.mapper;

import com.zs.bean.Song;
import com.zs.bean.SongList;

import java.util.List;

public interface SongListMapper {

    void insertSongList(SongList songList);

    List<SongList> selectAllSongList();

    void insertSongInList(Integer songId, Integer lId);

    List<SongList> selectSongListByUId(Integer uId);

    SongList selectSongListBylId(Integer lId);

    List<Song> selectSongDateByLId(Integer lId);

    void insertLike(Integer uId);

    void doInsertSongToSongList(Integer lId, Integer songId);

    void doDeleteSongToSongList(Integer lId, Integer songId);

    List<SongList> selectSongListByFindName(String findName);

    void updateListenNum(Integer lId, Integer num);

    void updateSongListSongNum(Integer tempLId,Integer songNum);

    Integer selectSongNum(Integer tempLId);

    List<SongList> selectSongListByTId(Integer tId);

    void deleteSongList(Integer lId);

    Integer selectCollectNum(String name);

}
