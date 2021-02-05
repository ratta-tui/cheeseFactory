package com.sign.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.sign.test.vo.Review;
import com.sign.test.vo.User;

public interface ReviewMapper {
	
	@Insert("INSERT INTO reviews (text, book_id, user_id) VALUES (#{text}, #{bookId}, ${userId})")
	void createReview(Review review);
	
	@Select("SELECT * FROM reviews WHERE book_id = #{bookId} ORDER BY id DESC")
	@Results(value = {
			@Result(property = "id", column = "id"),
			@Result(property = "text", column = "text"),
			@Result(property = "bookId", column = "book_id"),
			@Result(property = "userId", column = "user_id"),
			@Result(property = "user", column = "id", javaType= User.class, one = @One(select = "getUserById"))
	})
	List<Review> getReviews(int bookId);
	
	@Select("select * from users where id = #{userId}")
	public User getUserById(int userId);
}
