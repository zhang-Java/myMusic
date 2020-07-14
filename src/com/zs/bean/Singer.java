package com.zs.bean;

import java.util.List;

public class Singer {

    Integer sId;
    String sName;
    String region;
    String sex;
    String firstLetter;
    String style;
    Integer singleNum;
    Integer albumNum;
    Integer mvNum;
    Integer sAttentionNum;
    String sIntroduction;
    Integer enter;
    String sPhotoUrl;

    public Singer() {
    }

    public Singer(Integer sId, String sName, String region, String sex, String firstLetter, String style, Integer singleNum, Integer albumNum, Integer mvNum, Integer sAttentionNum, String sIntroduction, Integer enter, String sPhotoUrl) {
        this.sId = sId;
        this.sName = sName;
        this.region = region;
        this.sex = sex;
        this.firstLetter = firstLetter;
        this.style = style;
        this.singleNum = singleNum;
        this.albumNum = albumNum;
        this.mvNum = mvNum;
        this.sAttentionNum = sAttentionNum;
        this.sIntroduction = sIntroduction;
        this.enter = enter;
        this.sPhotoUrl = sPhotoUrl;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public Integer getSingleNum() {
        return singleNum;
    }

    public void setSingleNum(Integer singleNum) {
        this.singleNum = singleNum;
    }

    public Integer getAlbumNum() {
        return albumNum;
    }

    public void setAlbumNum(Integer albumNum) {
        this.albumNum = albumNum;
    }

    public Integer getMvNum() {
        return mvNum;
    }

    public void setMvNum(Integer mvNum) {
        this.mvNum = mvNum;
    }

    public Integer getsAttentionNum() {
        return sAttentionNum;
    }

    public void setsAttentionNum(Integer sAttentionNum) {
        this.sAttentionNum = sAttentionNum;
    }

    public String getsIntroduction() {
        return sIntroduction;
    }

    public void setsIntroduction(String sIntroduction) {
        this.sIntroduction = sIntroduction;
    }

    public Integer getEnter() {
        return enter;
    }

    public void setEnter(Integer enter) {
        this.enter = enter;
    }

    public String getsPhotoUrl() {
        return sPhotoUrl;
    }

    public void setsPhotoUrl(String sPhotoUrl) {
        this.sPhotoUrl = sPhotoUrl;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "sId=" + sId +
                ", sName='" + sName + '\'' +
                ", region='" + region + '\'' +
                ", sex='" + sex + '\'' +
                ", firstLetter='" + firstLetter + '\'' +
                ", style='" + style + '\'' +
                ", singleNum=" + singleNum +
                ", albumNum=" + albumNum +
                ", mvNum=" + mvNum +
                ", sAttentionNum=" + sAttentionNum +
                ", sIntroduction='" + sIntroduction + '\'' +
                ", enter=" + enter +
                ", sPhotoUrl='" + sPhotoUrl + '\'' +
                '}';
    }
}
