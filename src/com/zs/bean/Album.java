package com.zs.bean;

import java.util.List;

public class Album {

    Integer aId;
    String aName;
    Singer singer;
    String aTime;
    String aCompany;
    String aType;
    String aGenre;
    String aLanguage;
    String aIntroduction;
    Integer messageNum;

    public Album() {
    }

    public Album(Integer aId, String aName, Singer singer, String aTime, String aCompany, String aType, String aGenre, String aLanguage, String aIntroduction, Integer messageNum) {
        this.aId = aId;
        this.aName = aName;
        this.singer = singer;
        this.aTime = aTime;
        this.aCompany = aCompany;
        this.aType = aType;
        this.aGenre = aGenre;
        this.aLanguage = aLanguage;
        this.aIntroduction = aIntroduction;
        this.messageNum = messageNum;
    }


    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    public String getaTime() {
        return aTime;
    }

    public void setaTime(String aTime) {
        this.aTime = aTime;
    }

    public String getaCompany() {
        return aCompany;
    }

    public void setaCompany(String aCompany) {
        this.aCompany = aCompany;
    }

    public String getaType() {
        return aType;
    }

    public void setaType(String aType) {
        this.aType = aType;
    }

    public String getaGenre() {
        return aGenre;
    }

    public void setaGenre(String aGenre) {
        this.aGenre = aGenre;
    }

    public String getaLanguage() {
        return aLanguage;
    }

    public void setaLanguage(String aLanguage) {
        this.aLanguage = aLanguage;
    }

    public String getaIntroduction() {
        return aIntroduction;
    }

    public void setaIntroduction(String aIntroduction) {
        this.aIntroduction = aIntroduction;
    }

    public Integer getMessageNum() {
        return messageNum;
    }

    public void setMessageNum(Integer messageNum) {
        this.messageNum = messageNum;
    }

    @Override
    public String toString() {
        return "Album{" +
                "aId=" + aId +
                ", aName='" + aName + '\'' +
                ", singer=" + singer +
                ", aTime='" + aTime + '\'' +
                ", aCompany='" + aCompany + '\'' +
                ", aType='" + aType + '\'' +
                ", aGenre='" + aGenre + '\'' +
                ", aLanguage='" + aLanguage + '\'' +
                ", aIntroduction='" + aIntroduction + '\'' +
                ", messageNum=" + messageNum +
                '}';
    }
}
