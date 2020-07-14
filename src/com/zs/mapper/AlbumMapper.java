package com.zs.mapper;

import com.zs.bean.Album;
import com.zs.bean.Song;

import java.util.List;

public interface AlbumMapper {

    List<Album> selectAllAlbum();

    List<Album> selectAlbumByRegion(String r1, String r2);

    Album selectAlbumByAId(Integer aId);

    List<Album> selectAlbumByFindName(String findName);

}
