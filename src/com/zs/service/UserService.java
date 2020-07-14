package com.zs.service;

import com.zs.bean.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
public interface UserService {
    void insertUser(User user);

    void updateUer(User user);

    User selectUserByIdAndPassword(Integer uNumber, String uPassword);

    User selectUserExist(Integer uNumber);

    Integer selectMaxNumber();

    User selectUserByUId(Integer uId);

    User selectUserByUNumber(int uNumber);

    List<User> selectUserByFindName(String findName);

    List<User> selectAUserByUId(Integer uId);

    List<User> selectFUserByUId(Integer uId);
}
