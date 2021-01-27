package jhservice.fwd.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import jhservice.fwd.service.FwdService;
import jhservice.fwd.service.FwdVO;

@Controller
public class FwdController {
	
		@Resource(name = "fwdService")
		private FwdService fwdService;
	
	
		@RequestMapping(value = "/reqUrl.do")
		public String selectR(@ModelAttribute("searchVO") FwdVO searchVO, ModelMap model) throws Exception {
			
			List<EgovMap> resultList = fwdService.selctTargetUrl(searchVO);
			String URL = (String) resultList.get(0).get("urlStr");
			return "redirect:http://"+URL;
			
		}
		
		
}
