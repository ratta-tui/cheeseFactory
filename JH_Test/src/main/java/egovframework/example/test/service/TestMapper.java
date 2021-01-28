package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.domain.TestVO;

public interface TestMapper {

	public List<TestVO> selectTest(TestVO testVO) throws Exception;

}
