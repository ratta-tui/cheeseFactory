package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.domain.TestVO;

public interface TestService {
	
	public List<TestVO> selectTest(TestVO testVO) throws Exception;

	public void insertTest(TestVO testVO) throws Exception;

	public TestVO selectDetail(TestVO testVO)throws Exception;
	
	public void updateTest(TestVO testVO)throws Exception;

	public void deleteTest(TestVO testVO)throws Exception;

}
