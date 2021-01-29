package egovframework.example.test.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestService;


@Controller
public class TestController {
	
		//메인 페이지
		@Autowired
		private TestService testServiceImpl;

		@RequestMapping(value = "/testList.do")
		public String testListDo(TestVO testVO, Model model) throws Exception {
			
			model.addAttribute("list", testServiceImpl.selectTest(testVO));
			//여기는 파일 내 이동할 jsp 위치
			return "test/testList";
		}
		
		//글 작성 클릭시 글 작성 페이지로 이동
		@RequestMapping(value= "/testRegister.do")
		public String testRegister() {
			return "test/testRegister";
		}
		
		//글 작성 버튼 클릭시 이동
		@RequestMapping(value="/insertTest.do")
		public String write(@ModelAttribute("testVO") TestVO testVO, Model model, RedirectAttributes rttr) throws Exception {
			testServiceImpl.insertTest(testVO);
			//다시 testlist 주소 입력한 상태로 보내서 testlist.jsp 가 열리게끔 함. 
			return "redirect:testList.do";
		}
		
		// HttpServletRequest 객체안에 모든 데이터들이 들어가서 통신하고, getParameter 내장 메소드를 통해 원하는 testId 를 가져오는 방식
		//게시글 클릭시 상세 보기
		@RequestMapping(value="/testDetail.do")
		public String viewForm(@ModelAttribute("testVO") TestVO testVO, Model model,HttpServletRequest request) throws Exception {
			
			int testId = Integer.parseInt(request.getParameter("testId"));
			testVO.setTestId(testId);
			
			TestVO resultVO = testServiceImpl.selectDetail(testVO);
			model.addAttribute("result", resultVO);
			
			return "test/testDetail";
		}
		
		//게시글 수정하기
		@RequestMapping(value="/updateTest.do")
		public String updateTest(@ModelAttribute("testVO") TestVO testVO, Model model, HttpServletRequest request) throws Exception {
			testServiceImpl.updateTest(testVO);
			return "redirect:testList.do";
		}
		
		//게시글 삭제하기
		@RequestMapping(value="/deleteTest.do")
		public String deleteTest(@ModelAttribute("testVO") TestVO testVO) throws Exception {
			testServiceImpl.deleteTest(testVO);
			return "redirect:testList.do";
		}
		
}
