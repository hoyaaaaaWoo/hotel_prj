package user_login;

import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

public class updateDAO {

	
	/**
	 * �̸��� �����ϴ� ��.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateEmail(memberVO mVO)throws SQLException{
		String email="";
		//1.Spring Container ���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String updateEmail="update member set email=? where id=?";
		email=
				jt.queryForObject(updateEmail, new Object[] {mVO.getEmail()},String.class );
		//4. Spring Container �ݱ�.
		gjt.closeAc();
		
		return email;
	}
	
	/**
	 * �̸� �����ϴ� ��.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateKname(memberVO mVO)throws SQLException{
		String kname="";
		//1.Spring Container ���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String updateKname="update member set kname=? where id=?";
		kname=
				jt.queryForObject(updateKname, new Object[] {mVO.getKname()},String.class );
		//4. Spring Container �ݱ�.
		gjt.closeAc();
		
		return kname;
	}
	
	/**
	 * ��ȭ��ȣ �����ϴ� ��.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String updateTel(memberVO mVO)throws SQLException{
		String tel="";
		//1.Spring Container ���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String updateTel="update member set tel=? where id=?";
		tel=
				jt.queryForObject(updateTel, new Object[] {mVO.getTel()},String.class );
		//4. Spring Container �ݱ�.
		gjt.closeAc();
		
		return tel;
	}
	
	/**
	 * @param kname
	 * @return
	 */
	public int delmember(String id) {
		int cnt=0;

		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
		String deleteRes = "delete from member where id = ?";
		cnt = jt.update(deleteRes, id);
		// 4. Spring Container �ݱ�
		gjt.closeAc();

		return cnt;
	}// delete
	
	
}
