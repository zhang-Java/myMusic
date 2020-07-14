package com.zs.service;

public interface AttentionService {

    void insertAttentionSinger(Integer uId, Integer sId);

    void insertAttentionUser(Integer uId1, Integer uId2);

    void deleteAttentionUser(Integer uId1, Integer uId2);

    void deleteAttentionSinger(Integer uId, Integer sId);
}
