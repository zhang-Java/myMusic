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
public interface AlbumService {

    Album selectAlbumByAId(Integer aId);

    List<Album> selectAllAlbum();

    List<Album> selectAlbumByRegion(String r1, String r2);

    List<Album> selectAlbumByFindName(String findName);

}
