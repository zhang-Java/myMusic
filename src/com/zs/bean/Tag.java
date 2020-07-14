package com.zs.bean;

public class Tag {

    Integer tId;
    String tName;
    String tType;

    public Tag() {
    }

    public Tag(Integer tId, String tName, String tType) {
        this.tId = tId;
        this.tName = tName;
        this.tType = tType;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettType() {
        return tType;
    }

    public void settType(String tType) {
        this.tType = tType;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "tId=" + tId +
                ", tName='" + tName + '\'' +
                ", tType='" + tType + '\'' +
                '}';
    }
}

