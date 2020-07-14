package com.zs.bean;

public class Fans {

    Integer fId;
    User user1;
    User user2;

    public Fans() {
    }

    public Fans(Integer fId, User user1, User user2) {
        this.fId = fId;
        this.user1 = user1;
        this.user2 = user2;
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    @Override
    public String toString() {
        return "Fans{" +
                "fId=" + fId +
                ", user1=" + user1 +
                ", user2=" + user2 +
                '}';
    }
}
