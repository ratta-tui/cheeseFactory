package egovframework.example.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestMapper;

@Service("testDAOService")
public class TestDAOService implements TestDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TestVO> selectTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectTest(testVO);
	}
	
}
