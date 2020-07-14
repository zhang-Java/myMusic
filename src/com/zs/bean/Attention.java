package com.zs.bean;

public class Attention {

    Integer attentionId;
    User user;
    Singer singer;

    public Attention() {
    }

    public Attention(Integer attentionId, User user, Singer singer) {
        this.attentionId = attentionId;
        this.user = user;
        this.singer = singer;
    }

    public Integer getAttentionId() {
        return attentionId;
    }

    public void setAttentionId(Integer attentionId) {
        this.attentionId = attentionId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    @Override
    public String toString() {
        return "Attention{" +
                "attentionId=" + attentionId +
                ", user=" + user +
                ", singer=" + singer +
                '}';
    }
}
