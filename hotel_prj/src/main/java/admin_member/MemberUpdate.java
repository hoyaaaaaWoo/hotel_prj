package admin_member;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;


import team3_dao.GetJdbcTemplate;
public class MemberUpdate {

	
	public int updateMember(MemberVO mVO) throws DataAccessException {
		int cnt =0;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt = gjt.getJdbcTemplate();
	
		String updateMember =" update member set tel=?,email=?,m_status=? where kname=?";
		cnt=jt.update(updateMember,mVO.getM_status(),mVO.getKname(),mVO.getTel(),mVO.getEmail());
		gjt.closeAc();

		return cnt;
	}//updateEmp
	
	
	
	
	
	
	
}//class
