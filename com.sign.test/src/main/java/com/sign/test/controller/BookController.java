package com.sign.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sign.test.mapper.BookMapper;
import com.sign.test.vo.Book;

@Controller
public class BookController {
	
	@Autowired
	private BookMapper bookMapper;

	
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String index(Model model) {
		//맵퍼로 부터 리스트 받아옴
		List<Book> books = bookMapper.getList();
		
		//모델을 통해 뷰페이지로 데이터 전달
		model.addAttribute("books", books);
		return "books/index";
	}
	
	@RequestMapping(value = "books/newBook", method = RequestMethod.GET)
	public String newBook() {
		return "books/newBook"; 
	}
	
	@RequestMapping(value = "/books", method = RequestMethod.POST)
	public String create(@ModelAttribute Book book) {
		bookMapper.create(book);
		System.out.println(book.toString());
		return "books/index";
	}
}
