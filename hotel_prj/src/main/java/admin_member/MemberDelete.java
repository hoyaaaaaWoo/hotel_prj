package admin_member;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

public class MemberDelete {

	public int deleteMember(String kname) throws DataAccessException{
		
		int cnt =0;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String deleteMember = "delete from member where id=?";
		cnt=jt.update(deleteMember, kname);
		
		gjt.closeAc();

		return cnt;
	}//deleteMember
	
}//class
