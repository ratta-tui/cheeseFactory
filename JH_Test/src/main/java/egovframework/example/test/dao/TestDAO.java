package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.domain.TestVO;

public interface TestDAO {
	
	List<TestVO> selectTest(TestVO testVO) throws Exception;
	
}


