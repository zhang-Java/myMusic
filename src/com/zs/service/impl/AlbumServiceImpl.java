package com.zs.service.impl;

import com.zs.bean.Album;
import com.zs.bean.Song;
import com.zs.mapper.AlbumMapper;
import com.zs.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlbumServiceImpl implements AlbumService {

    @Autowired
    private AlbumMapper albumMapper;

    @Override
    public Album selectAlbumByAId(Integer aId) {
        return albumMapper.selectAlbumByAId(aId);
    }

    @Override
    public List<Album> selectAllAlbum() {
        return albumMapper.selectAllAlbum();
    }

    @Override
    public List<Album> selectAlbumByRegion(String r1, String r2) {
        return albumMapper.selectAlbumByRegion(r1,r2);
    }

    @Override
    public List<Album> selectAlbumByFindName(String findName) {
        return albumMapper.selectAlbumByFindName(findName);
    }

}
