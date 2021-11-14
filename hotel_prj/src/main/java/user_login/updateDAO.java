package user_login;

import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

public class updateDAO {

	
	/**
	 * 이메일 수정하는 일.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateEmail(memberVO mVO)throws SQLException{
		String email="";
		//1.Spring Container 얻기
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate 얻기
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.쿼리문 수행.
		String updateEmail="update member set email=? where id=?";
		email=
				jt.queryForObject(updateEmail, new Object[] {mVO.getEmail()},String.class );
		//4. Spring Container 닫기.
		gjt.closeAc();
		
		return email;
	}
	
	/**
	 * 이름 수정하는 일.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateKname(memberVO mVO)throws SQLException{
		String kname="";
		//1.Spring Container 얻기
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate 얻기
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.쿼리문 수행.
		String updateKname="update member set kname=? where id=?";
		kname=
				jt.queryForObject(updateKname, new Object[] {mVO.getKname()},String.class );
		//4. Spring Container 닫기.
		gjt.closeAc();
		
		return kname;
	}
	
	/**
	 * 전화번호 수정하는 일.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateTel(memberVO mVO)throws SQLException{
		String tel="";
		//1.Spring Container 얻기
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate 얻기
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.쿼리문 수행.
		String updateTel="update member set tel=? where id=?";
		tel=
				jt.queryForObject(updateTel, new Object[] {mVO.getTel()},String.class );
		//4. Spring Container 닫기.
		gjt.closeAc();
		
		return tel;
	}
	
	/**
	 * @param kname
	 * @return
	 */
	public int delmember(String id) {
		int cnt=0;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		String deleteRes = "delete from member where id = ?";
		cnt = jt.update(deleteRes, id);
		// 4. Spring Container 닫기
		gjt.closeAc();

		return cnt;
	}// delete
	
	
}
