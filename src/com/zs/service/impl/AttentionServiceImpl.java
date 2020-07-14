package com.zs.service.impl;

import com.zs.mapper.AttentionMapper;
import com.zs.service.AlbumService;
import com.zs.service.AttentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttentionServiceImpl implements AttentionService {
    @Autowired
    AttentionMapper attentionMapper;
    @Override
    public void insertAttentionSinger(Integer uId, Integer sId) {
        attentionMapper.insertAttentionSinger(uId,sId);
    }

    @Override
    public void insertAttentionUser(Integer uId1, Integer uId2) {
        attentionMapper.insertAttentionUser(uId1,uId2);
    }

    @Override
    public void deleteAttentionUser(Integer uId1, Integer uId2) {
        attentionMapper.deleteAttentionUser(uId1,uId2);
    }

    @Override
    public void deleteAttentionSinger(Integer uId, Integer sId) {
        attentionMapper.deleteAttentionSinger(uId,sId);
    }
}
