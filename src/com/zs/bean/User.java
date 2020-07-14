package com.zs.bean;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:03
 */
public class User {
    private Integer uId;
    private String uName;
    private String uPassword;
    private String uNumber;
    private Integer uAttentionNum;
    private Integer uFansNum;
    private String uPhotoUrl;

    public User() {
    }

    public User(String uName, String uPassword, String uNumber) {
        this.uName = uName;
        this.uPassword = uPassword;
        this.uNumber = uNumber;
    }

    public User(Integer uId, String uName, String uPassword, String uNumber, Integer uAttentionNum, Integer uFansNum, String uPhotoUrl) {
        this.uId = uId;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uNumber = uNumber;
        this.uAttentionNum = uAttentionNum;
        this.uFansNum = uFansNum;
        this.uPhotoUrl = uPhotoUrl;
    }


    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuNumber() {
        return uNumber;
    }

    public void setuNumber(String uNumber) {
        this.uNumber = uNumber;
    }

    public Integer getuAttentionNum() {
        return uAttentionNum;
    }

    public void setuAttentionNum(Integer uAttentionNum) {
        this.uAttentionNum = uAttentionNum;
    }

    public Integer getuFansNum() {
        return uFansNum;
    }

    public void setuFansNum(Integer uFansNum) {
        this.uFansNum = uFansNum;
    }

    public String getuPhotoUrl() {
        return uPhotoUrl;
    }

    public void setuPhotoUrl(String uPhotoUrl) {
        this.uPhotoUrl = uPhotoUrl;
    }


    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", uNumber='" + uNumber + '\'' +
                ", uAttentionNum=" + uAttentionNum +
                ", uFansNum=" + uFansNum +
                ", uPhotoUrl='" + uPhotoUrl + '\'' +
                '}';
    }
}
