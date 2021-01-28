package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.TestDAO;
import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestService;

@Service("testServiceImpl")
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestDAO testDAOService;
	
	@Override
	public List<TestVO> selectTest(TestVO testVO) throws Exception {
		
		return testDAOService.selectTest(testVO);
	}

}
