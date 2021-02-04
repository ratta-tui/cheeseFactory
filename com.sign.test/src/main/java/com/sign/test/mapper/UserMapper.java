package com.sign.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;

import com.sign.test.vo.Authority;
import com.sign.test.vo.User;


public interface UserMapper {
    @Insert("INSERT INTO users (email, password, enabled) "
            + "VALUES (#{email}, #{password}, true)")
    public boolean insertUser(User user);
    @Insert("INSERT INTO authorities (email, authority) "
            + "VALUES (#{email}, #{authority})")
    public boolean insertAuthority(@Param("email") String email, @Param("authority") String authority);
    
    @Select("SELECT id, email  FROM users")
    @Results(value = {
    		@Result(property = "id", column = "id"),
    		@Result(property = "email", column = "email"),
    		@Result(property = "authorities", column = "email" , javaType = List.class, many = @Many(select = "selectAuthority") )
    		
    })
    public List<User> selectUsers();
    
    @Select("SELECT email, authority "
            + "FROM authorities "
            + "WHERE email = #{email}")
    public List<Authority> selectAuthority(String email);
    
}