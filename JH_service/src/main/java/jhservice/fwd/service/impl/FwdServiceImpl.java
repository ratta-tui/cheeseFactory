package jhservice.fwd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import jhservice.cmmn.dao.CommonDAO;
import jhservice.fwd.service.FwdService;
import jhservice.fwd.service.FwdVO;

@Service("fwdService")
public class FwdServiceImpl extends EgovAbstractServiceImpl implements FwdService {
	
		@Resource(name = "CommonDAO")
		private CommonDAO dao;

		@Override
		public List<EgovMap> selctTargetUrl(FwdVO vo) {
			// TODO Auto-generated method stub
			return dao.selectList("fwd.selectTargetUrl", vo);
		}
	
	

}
