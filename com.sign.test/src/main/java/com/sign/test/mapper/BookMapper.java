package com.sign.test.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sign.test.vo.Book;

public interface BookMapper {

	@Insert("insert into books (title, author, image) values (#{title}, #{author}, #{image})")
	public boolean create(Book book);
	
	@Select("select * from books")
	public List<Book> getList();
}
