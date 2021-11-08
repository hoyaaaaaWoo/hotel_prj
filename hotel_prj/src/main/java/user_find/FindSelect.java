package user_find;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import admin_member.MemberVO;
import team3_dao.GetJdbcTemplate;

/**
 * ���̵�� ��й�ȣ ã��
 * @author user
 *
 */
public class FindSelect {
	
	/**
	 * �̸��� �̸��Ϸ� ���̵� ã��
	 * @param mVO
	 * @return
	 * @throws DataAccessException
	 */
	public String findId(MemberVO mVO) throws DataAccessException {
		String id="";
		
		//1. ������ �����̳� ����
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. ������ ����
		String selectPass = "select id from member where kname=? and email=?";
		id = jt.queryForObject(selectPass, new Object[] {mVO.getKname(), mVO.getEmail()}, String.class);
		//4. �����������̳� �ݱ�
		gjt.closeAc();
		
		return id;		
	}

	/**
	 * �̸��� ���̵�� �̸��Ϸ� ��й�ȣ ã��
	 * @param mVO
	 * @return
	 * @throws DataAccessException
	 */
	public String findPass(MemberVO mVO) throws DataAccessException {
		String pass="";
		
		//1. ������ �����̳� ����
	      GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
	      // �̰� ����꾲�ø� �� ���ϰ� �Ͻǰſ���. ����꿡 DB�������� �����Ѱ������ϱ� �װ� �����ٰ� ���ø� Ǯ�н��� ��Ű���� �� �Ƚᵵ�ſ��׸��� ������ ����꾲��������ϱ� �װ� ������!
	      //2. JdbcTemplate ���
	      JdbcTemplate jt = gjt.getJdbcTemplate();
	      //3. ������ ����
	      String selectPass = "select pass from member where kname=? and id=? and email=?";
	      pass = jt.queryForObject(selectPass, new Object[] {mVO.getKname(), mVO.getId(), mVO.getEmail()}, String.class);
	      //4. �����������̳� �ݱ�
	      gjt.closeAc();
	      
	      return pass;		
	}
	
	
}
