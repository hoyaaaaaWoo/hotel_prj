package user_find;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import admin_member.MemberVO;
import team3_dao.GetJdbcTemplate;
import user_reservation.ReservationVO;

/**
 * 아이디와 비밀번호 찾기
 * @author user
 *
 */
public class FindSelect {
	
	/**
	 * 이름과 이메일로 아이디 찾기
	 * @param mVO
	 * @return
	 * @throws DataAccessException
	 */
	public FindVO findId(String id) throws DataAccessException {
		FindVO fv=null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String selectId = "select id from member where kname=? and email=?";
		fv = jt.queryForObject(selectId, new RowMapper<FindVO>() {

			@Override
			public FindVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				FindVO fVO=new FindVO();
				
				fVO.setKname(rs.getString("kname"));
				fVO.setEmail(rs.getString("email"));
				
				return fVO;
			}
			
		});
		gjt.closeAc();
		
		return fv;		
	}

	/**
	 * 이름과 아이디와 이메일로 비밀번호 찾기
	 * @param mVO
	 * @return
	 * @throws DataAccessException
	 */
	public FindVO findPass(String pass) throws DataAccessException {
		FindVO fv=null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String selectPass = "select pass from member where id=? kname=? and email=?";
		fv = jt.queryForObject(selectPass, new RowMapper<FindVO>() {

			@Override
			public FindVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				FindVO fVO=new FindVO();
				
				fVO.setId(rs.getString("id"));
				fVO.setKname(rs.getString("kname"));
				fVO.setEmail(rs.getString("email"));
				
				return fVO;
			}
			
		});
		gjt.closeAc();
		
		return fv;		
	}
	
}
