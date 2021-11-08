package admin_member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import admin_member.MemberSelect.SelectMember;
import team3_dao.GetJdbcTemplate;

/**
 * 탈퇴회원 조회
 * @author user
 */
public class MemberDelete {

	/**
	 *  전체회원 조회 ( 아이디,이름,생년월일,번호,이메일,영문이름)
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<MemberVO> selectDeleteMember(String id) throws SQLException{
		List<MemberVO> list = null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();

		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		StringBuilder selectDeleteMember = new StringBuilder();
		selectDeleteMember.append
		(" select id,kname,out_date")
		.append(" from member ");
		if( id !=null) {
			selectDeleteMember.append(" where id=?");
		}
		if( id == null) {
			list=jt.query(selectDeleteMember.toString(), new selectDeleteMember());
		}else {
			 list=jt.query(selectDeleteMember.toString(),new Object[] { Long.valueOf(id) },new selectDeleteMember());
		}
		gjt.closeAc();
		return list;
	}//MemberSelect
	
	public class selectDeleteMember implements RowMapper<MemberVO> {
	      public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
	         MemberVO mv=new MemberVO();
	         mv.setId(rs.getString("id"));
	         mv.setKname(rs.getString("kname"));
	         mv.setOut_date(rs.getDate("out_date"));
	         return mv;
	      }
	   }
}//class
