package com.zs.mapper;

import com.zs.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: DengLong
 * Date: 2020-03-22
 * Time: 16:04
 */
public interface UserMapper {
    @Insert("insert into user values(null,#{uName},#{uPassword},#{uNumber},0,0,'/resource/img/tx/tx0.jpg')")
    void insertUser(User user);

    @Update("UPDATE user SET u_attention_num=#{uAttentionNum},u_fans_num=#{uFansNum},u_password=#{uPassword} WHERE u_id=#{uId};")
    void updateUer(User user);

    User selectUserByIdAndPassword(Integer uNumber,String uPassword);

    User selectUserExist(Integer uNumber);

    Integer selectMaxNumber();

    User selectUserByUId(Integer uId);

    User selectUserByUNumber(int uNumber);

    List<User> selectUserByFindName(String findName);

    List<User> selectAUserByUId(Integer uId);

    List<User> selectFUserByUId(Integer uId);

}
