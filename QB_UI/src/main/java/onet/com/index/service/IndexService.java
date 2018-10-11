package onet.com.index.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.index.dao.IndexDao;
import onet.com.vo.MemberDto;

@Service
public class IndexService {

		@Autowired
		private SqlSession sqlsession;
		
		public int loginCheck(MemberDto dto){
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			int result = dao.loginCheck(dto);
			return result;
		}
		
		public String authCheck(MemberDto dto) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			String result = dao.authCheck(dto);
			return result;
		}
		
		public int insertMember(MemberDto dto) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			int result = dao.insertMember(dto);
			return result;
		}
		
		public String joinCheckId(String member_id) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			String result = dao.joinCheckId(member_id);
			return result;
		}
		
	
}
