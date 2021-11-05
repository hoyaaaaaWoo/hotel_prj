package admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import kr.co.sist.dao.GetJdbcTemplate;

public class MemberSelect {

	/**
	 *  전체회원 조회 ( 아이디,이름,생년월일,번호,이메일,영문이름)
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<MemberVO> selectMember(String id) throws SQLException{
		List<MemberVO> list = null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();

		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		StringBuilder selectMember = new StringBuilder();
		selectMember.append
		(" select id,kname,birth_year,tel,email,ename_fst,ename_lst")
		.append(" from member ");
		if( id !=null) {
			selectMember.append(" where id=?");
		}
		if( id == null) {
			list=jt.query(selectMember.toString(), new SelectMember());
		}else {
			 list=jt.query(selectMember.toString(),new Object[] { Long.valueOf(id) },new SelectMember());
		}
		gjt.closeAc();
		return list;
	}//MemberSelect
	
	public class SelectMember implements RowMapper<MemberVO> {
	      public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
	         MemberVO mv=new MemberVO();
	         mv.setId(rs.getString("id"));
	         mv.setKname(rs.getString("kname"));
	         mv.setBirth_year(rs.getString("birth_year"));
	         mv.setTel(rs.getString("tel"));
	         mv.setEmail(rs.getString("email"));
	         mv.setEname_fst(rs.getString("ename_fst"));
	         mv.setEname_lst(rs.getString("ename_lst"));
	         return mv;
	      }
	   }
	
}//class
