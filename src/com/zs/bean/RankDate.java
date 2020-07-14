package com.zs.bean;

public class RankDate {

    Integer rankId;
    RankList rankList;
    Song song;
    Integer rankN;
    Integer changeN;

    public RankDate() {
    }

    public RankDate(Integer rankId, RankList rankList, Song song, Integer rankN, Integer changeN) {
        this.rankId = rankId;
        this.rankList = rankList;
        this.song = song;
        this.rankN = rankN;
        this.changeN = changeN;
    }

    public Integer getRankId() {
        return rankId;
    }

    public void setRankId(Integer rankId) {
        this.rankId = rankId;
    }

    public RankList getRankList() {
        return rankList;
    }

    public void setRankList(RankList rankList) {
        this.rankList = rankList;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Integer getRankN() {
        return rankN;
    }

    public void setRankN(Integer rankN) {
        this.rankN = rankN;
    }

    public Integer getChangeN() {
        return changeN;
    }

    public void setChangeN(Integer changeN) {
        this.changeN = changeN;
    }

    @Override
    public String toString() {
        return "RankDate{" +
                "rankId=" + rankId +
                ", rankList=" + rankList +
                ", song=" + song +
                ", rankN=" + rankN +
                ", changeN=" + changeN +
                '}';
    }
}
