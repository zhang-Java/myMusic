package com.zs.bean;

import java.util.List;

public class RankList {

    Integer rId;
    String rTime;
    String rule;
    Integer rMessageNum;
    String rName;
    String rType;


    public RankList() {
    }

    public RankList(Integer rId, String rTime, String rule, Integer rMessageNum, String rName, String rType) {
        this.rId = rId;
        this.rTime = rTime;
        this.rule = rule;
        this.rMessageNum = rMessageNum;
        this.rName = rName;
        this.rType = rType;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getrTime() {
        return rTime;
    }

    public void setrTime(String rTime) {
        this.rTime = rTime;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public Integer getrMessageNum() {
        return rMessageNum;
    }

    public void setrMessageNum(Integer rMessageNum) {
        this.rMessageNum = rMessageNum;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrType() {
        return rType;
    }

    public void setrType(String rType) {
        this.rType = rType;
    }

    @Override
    public String toString() {
        return "RankList{" +
                "rId=" + rId +
                ", rTime='" + rTime + '\'' +
                ", rule='" + rule + '\'' +
                ", rMessageNum=" + rMessageNum +
                ", rName='" + rName + '\'' +
                ", rType='" + rType + '\'' +
                '}';
    }
}
