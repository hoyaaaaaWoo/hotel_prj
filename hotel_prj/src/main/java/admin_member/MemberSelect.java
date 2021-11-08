package admin_member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

public class MemberSelect {

	/**
	 *  ��üȸ�� ��ȸ ( ���̵�,�̸�,�������,��ȣ,�̸���,�����̸�)
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
		(" select id,kname,birth_year,tel,email,ename_fst,ename_lst,out_date,m_status")
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
	
	/**
	 * �̸��� ��ȸ�Ͽ� Ư��ȸ�� ��ȸ
	 * @param kname
	 * @return
	 * @throws EmptyResultDataAccessException
	 * @throws IncorrectResultSizeDataAccessException
	 * @throws BadSqlGrammarException
	 */
	 public MemberVO selectSpecificMember(String kname)throws SQLException{//mapRow method throws
	      MemberVO mVO=null;
	      
	      //1. Spring Container ���
	      GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
	      //2 JdbcTemplate ���
	      JdbcTemplate jt=gjt.getJdbcTemplate();
	      //3. ���� ����
	      String select="select id,kname,birth_year,tel,email,ename_fst,ename_lst from member where kname=?";
	      //interface�� anonymous inner class�� �����Ͽ� �׾ȿ��� ��ȸ����� VO�� �Ҵ�.
	      mVO=jt.queryForObject(select, new Object[] { kname },
	            new RowMapper<MemberVO>() {
	            public MemberVO mapRow(ResultSet rs,int rowNum)throws SQLException{
	            	MemberVO mVO=new MemberVO();
	               //ResultSet�� ����Ͽ� ��ȸ����� VO�� ����
	               mVO.setId(rs.getString("id"));
	               mVO.setKname(rs.getString("kname"));
	               mVO.setBirth_year(rs.getString("birth_year"));
	               mVO.setTel(rs.getString("tel"));
	               mVO.setEmail(rs.getString("email"));
	               mVO.setEname_fst(rs.getString("ename_fst"));
	               mVO.setEname_lst(rs.getString("ename_lst"));
	               //��ȸ����� ������ dv��ȯ
	               return mVO;
	            }
	            } );
	      //4,. Spring Container �ݱ�
	      gjt.closeAc();
	      return mVO; 
	   }
	   
	
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
	         mv.setEname_lst(rs.getString("out_date"));
	         mv.setM_status(rs.getString("m_status"));
	         return mv;
	      }
	   }
	
	
	
}//class
