package com.sign.test.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.compiler.MemberResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sign.test.helper.Filehelper;
import com.sign.test.mapper.BookMapper;
import com.sign.test.mapper.ReviewMapper;
import com.sign.test.mapper.UserMapper;
import com.sign.test.vo.Book;
import com.sign.test.vo.Review;
import com.sign.test.vo.User;

@Controller
public class BookController {
	
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String index(Model model) {
		//맵퍼로 부터 리스트 받아옴
		List<Book> books = bookMapper.getList();
		System.out.println("맵퍼로 부터 리스트 받아옴 ");
		//모델을 통해 뷰페이지로 데이터 전달
		model.addAttribute("books", books);
		System.out.println("모델을 통해 뷰페이지로 데이터 전달됨");
		return "books/index";
	}
	
	@RequestMapping(value = "books/newBook", method = RequestMethod.GET)
	public String newBook() {
		return "books/newBook"; 
	}
	
	@RequestMapping(value = "/books", method = RequestMethod.POST)
	public String create(@ModelAttribute Book book, @RequestParam MultipartFile file, HttpServletRequest request) {
		String fileUrl = Filehelper.upload("/upload", file, request);
		book.setImage(fileUrl);
		bookMapper.create(book);
		System.out.println("업로드 경로 :: " + fileUrl + "\n" +  "업로드 사항 ::" + book.toString());
		return "redirect:/books";
	}
	
	/*@PathVariable 어노테이션
	* 	{}를 활용해 url에 변수처럼 사용될 값을 적어준뒤, {}안에 적은 변수명을 name 속성 값으로 넣는다.
	*	그 이후 이를 받을 자료형과 변수명을 앞에 선언해준다면 작동된다
	*	+REST API에서 많이 사용되어진다. 
	*/
	@RequestMapping(value= "/books/edit/{id}" , method= RequestMethod.GET)
	public String edit(@PathVariable int id, Model model) {
		Book book = bookMapper.getBook(id);
		model.addAttribute("book", book);
		System.out.println(bookMapper.getBook(id));
		return "books/edit";
	}
	
	@RequestMapping(value="/books/updates" , method = RequestMethod.POST )
	public String update(@ModelAttribute Book book) {
		bookMapper.update(book);
		System.out.println("내용 수정 완료 >>>>" +book.toString()); 
		return "redirect:/books";
	}
	
	//책 목록 삭제
	@RequestMapping(value="/books/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		bookMapper.delete(id);
		System.out.println("id : "+id +"  >> " + "삭제완료");
		return "redirect:/books";
	}
	
	
	@RequestMapping(value = "/books/{id}", method = RequestMethod.GET)
	public String show(@PathVariable int id, Model model, Principal principal) {
	    Book book = bookMapper.getBook(id);
	    model.addAttribute("book", book);
	    
	    
	    List<Review> reviews = reviewMapper.getReviews(id);
	    model.addAttribute("reviews", reviews);
	    
	    
	    // 폼 태그에서 modelAttribute="review" 속성을 읽어올 수 있어야함.
	    Review review = new Review();
	    review.setBookId(id);
//	    UserDetails principalemail = (UserDetails)authentication.getPrincipal();
//	    String email = principalemail.getUsername();
	    //이거도 안댐  Auten~~ 으로 받아와도 안댐   getname 에러 뜨면 일단 integer를 썻는지 부터 확인하자
	    String email = principal.getName();
	    int userId = userMapper.getUserIdByEmail(email);
	    review.setUserId(userId);
	    model.addAttribute("review", review);
	    return "books/show";
	}

	
}
