package com.zs.bean;

import java.util.List;

public class Song {

    Integer songId;
    Singer singer1;
    Singer singer2;
    Singer singer3;

    Album album;

    String songName;
    String sLong;
    String time;
    String lyric;
    Integer messageNum;
    Integer song_listenNum;
    Integer mv;

    List<Message> messageList;

    public Song() {
    }

    public Song(Integer songId, Singer singer1, Singer singer2, Singer singer3, Album album, String songName, String sLong, String time, String lyric, Integer messageNum, Integer song_listenNum, Integer mv, List<Message> messageList) {
        this.songId = songId;
        this.singer1 = singer1;
        this.singer2 = singer2;
        this.singer3 = singer3;
        this.album = album;
        this.songName = songName;
        this.sLong = sLong;
        this.time = time;
        this.lyric = lyric;
        this.messageNum = messageNum;
        this.song_listenNum = song_listenNum;
        this.mv = mv;
        this.messageList = messageList;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public Singer getSinger1() {
        return singer1;
    }

    public void setSinger1(Singer singer1) {
        this.singer1 = singer1;
    }

    public Singer getSinger2() {
        return singer2;
    }

    public void setSinger2(Singer singer2) {
        this.singer2 = singer2;
    }

    public Singer getSinger3() {
        return singer3;
    }

    public void setSinger3(Singer singer3) {
        this.singer3 = singer3;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getsLong() {
        return sLong;
    }

    public void setsLong(String sLong) {
        this.sLong = sLong;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public Integer getMessageNum() {
        return messageNum;
    }

    public void setMessageNum(Integer messageNum) {
        this.messageNum = messageNum;
    }

    public Integer getSong_listenNum() {
        return song_listenNum;
    }

    public void setSong_listenNum(Integer song_listenNum) {
        this.song_listenNum = song_listenNum;
    }

    public Integer getMv() {
        return mv;
    }

    public void setMv(Integer mv) {
        this.mv = mv;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

    @Override
    public String toString() {
        return "Song{" +
                "songId=" + songId +
                ", singer1=" + singer1 +
                ", singer2=" + singer2 +
                ", singer3=" + singer3 +
                ", album=" + album +
                ", songName='" + songName + '\'' +
                ", sLong='" + sLong + '\'' +
                ", time='" + time + '\'' +
                ", lyric='" + lyric + '\'' +
                ", messageNum=" + messageNum +
                ", song_listenNum=" + song_listenNum +
                ", mv=" + mv +
                ", messageList=" + messageList +
                '}';
    }
}
