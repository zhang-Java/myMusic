package com.zs.bean;

public class Message {

    Integer mId;
    User user;
    SongList songList;
    Song song;
    Album album;
    String mTime;
    Integer likeNum;
    String mContent;

    public Message() {
    }

    public Message(Integer mId, User user, SongList songList, Song song, Album album, String mTime, Integer likeNum, String mContent) {
        this.mId = mId;
        this.user = user;
        this.songList = songList;
        this.song = song;
        this.album = album;
        this.mTime = mTime;
        this.likeNum = likeNum;
        this.mContent = mContent;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public SongList getSongList() {
        return songList;
    }

    public void setSongList(SongList songList) {
        this.songList = songList;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public String getmTime() {
        return mTime;
    }

    public void setmTime(String mTime) {
        this.mTime = mTime;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public String getmContent() {
        return mContent;
    }

    public void setmContent(String mContent) {
        this.mContent = mContent;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mId=" + mId +
                ", user=" + user +
                ", songList=" + songList +
                ", song=" + song +
                ", album=" + album +
                ", mTime='" + mTime + '\'' +
                ", likeNum=" + likeNum +
                ", mContent='" + mContent + '\'' +
                '}';
    }
}
