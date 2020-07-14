package com.zs.service.impl;

import com.zs.bean.User;
import com.zs.mapper.UserMapper;
import com.zs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:06
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public void updateUer(User user) {
        userMapper.updateUer(user);
    }

    @Override
    public User selectUserByIdAndPassword(Integer uNumber, String uPassword) {

        return userMapper.selectUserByIdAndPassword(uNumber,uPassword);
    }

    @Override
    public User selectUserExist(Integer uNumber) {
        return userMapper.selectUserExist(uNumber);
    }

    @Override
    public Integer selectMaxNumber() {
        return userMapper.selectMaxNumber();
    }

    @Override
    public User selectUserByUId(Integer uId) {
        return userMapper.selectUserByUId(uId);
    }

    @Override
    public User selectUserByUNumber(int uNumber) {
        return userMapper.selectUserByUNumber(uNumber);
    }

    @Override
    public List<User> selectUserByFindName(String findName) {
        return userMapper.selectUserByFindName(findName);
    }

    @Override
    public List<User> selectAUserByUId(Integer uId) {
        return userMapper.selectAUserByUId(uId);
    }

    @Override
    public List<User> selectFUserByUId(Integer uId) {
        return userMapper.selectFUserByUId(uId);
    }
}
