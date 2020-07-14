package com.zs.bean;

import java.util.List;

public class SongList {

    Integer lId;
    String listName;
    User user;
    Tag tag1;
    Tag tag2;
    Tag tag3;

    Integer songNum;
    Integer lListenNum;
    String lPhotoUrl;
    Integer lMessageNum;
    List<Song> songs;

    public SongList() {
    }

    public SongList(Integer lId, String listName, User user, Tag tag1, Tag tag2, Tag tag3, Integer songNum, Integer lListenNum, String lPhotoUrl, Integer lMessageNum, List<Song> songs) {
        this.lId = lId;
        this.listName = listName;
        this.user = user;
        this.tag1 = tag1;
        this.tag2 = tag2;
        this.tag3 = tag3;
        this.songNum = songNum;
        this.lListenNum = lListenNum;
        this.lPhotoUrl = lPhotoUrl;
        this.lMessageNum = lMessageNum;
        this.songs = songs;
    }

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Tag getTag1() {
        return tag1;
    }

    public void setTag1(Tag tag1) {
        this.tag1 = tag1;
    }

    public Tag getTag2() {
        return tag2;
    }

    public void setTag2(Tag tag2) {
        this.tag2 = tag2;
    }

    public Tag getTag3() {
        return tag3;
    }

    public void setTag3(Tag tag3) {
        this.tag3 = tag3;
    }

    public Integer getSongNum() {
        return songNum;
    }

    public void setSongNum(Integer songNum) {
        this.songNum = songNum;
    }

    public Integer getlListenNum() {
        return lListenNum;
    }

    public void setlListenNum(Integer lListenNum) {
        this.lListenNum = lListenNum;
    }

    public String getlPhotoUrl() {
        return lPhotoUrl;
    }

    public void setlPhotoUrl(String lPhotoUrl) {
        this.lPhotoUrl = lPhotoUrl;
    }

    public Integer getlMessageNum() {
        return lMessageNum;
    }

    public void setlMessageNum(Integer lMessageNum) {
        this.lMessageNum = lMessageNum;
    }

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }

    @Override
    public String toString() {
        return "SongList{" +
                "lId=" + lId +
                ", listName='" + listName + '\'' +
                ", user=" + user +
                ", tag1=" + tag1 +
                ", tag2=" + tag2 +
                ", tag3=" + tag3 +
                ", songNum=" + songNum +
                ", lListenNum=" + lListenNum +
                ", lPhotoUrl='" + lPhotoUrl + '\'' +
                ", lMessageNum=" + lMessageNum +
                ", songs=" + songs +
                '}';
    }
}
