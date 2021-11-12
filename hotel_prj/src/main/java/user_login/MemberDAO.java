package user_login;

import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;


import team3_dao.GetJdbcTemplate;
/**
 * ȸ���� ���õ� �۾�.
 * ���̵� �ߺ�üũ, ȸ������ó��, �α��� ó��
 * ��й�ȣ ����, ȸ������ ����
 * @author user
 *
 */
public class MemberDAO {

	/**
	 * ���̵� �ߺ��˻� : ���̵� DB Table�� �����ϴ���?
	 * @param id ��ȸ�� id
	 * @return ��ȸ�� id
	 * @throws SQLException
	 */
	public String selectId(String id)throws SQLException{
		String returnId="";
		
		//1.Spring Container���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2.JdbcTemplate���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.���� ����.
		String selectId="select id from member where id=?";
		try {
			//�Ѱ��� ���ڵ尡 ��ȸ�Ǹ� ��ȸ����� ������ ����
			returnId=jt.queryForObject(selectId, new Object[] {id}, String.class);
		}catch(EmptyResultDataAccessException erdae){
			//��ȸ����� ���� ������ ���ܸ� �߻�.
			returnId="";
		}//end catch
		
		//4.Spring Container �ݱ�
		gjt.closeAc();
		return returnId;
	}//selectId
	
	/**
	 * �̸��� �ߺ��˻� : �̸����� DB Table�� �����ϴ���?
	 * @param email ��ȸ�� email
	 * @return ��ȸ�� email
	 * @throws SQLException
	 */
	public String selectEmail(String email)throws SQLException{
		String returnEmail="";
		
		//1.Spring Container���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2.JdbcTemplate���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.���� ����.
		String selectEmail="select email from member where email=?";
		try {
			//�Ѱ��� ���ڵ尡 ��ȸ�Ǹ� ��ȸ����� ������ ����
			returnEmail=jt.queryForObject(selectEmail, new Object[] {email}, String.class);
		}catch(EmptyResultDataAccessException erdae){
			//��ȸ����� ���� ������ ���ܸ� �߻�.
			returnEmail="";
		}//end catch	
		//4.Spring Container �ݱ�
		gjt.closeAc();
		return returnEmail;
	}//selectEmail
	
	/**
	 * ȸ������ �߰�
	 * @param mVO �� �Ķ���� ���� ���� VO
	 * @throws DataAccessException
	 */
	public void insertMember(memberVO mVO)throws DataAccessException{
		//1.������ �����̳� ����
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String insertMember="insert into member(id,email,pass,ename_fst,ename_lst,kname,birth_year,tel,req_agree,opt_agree)values(?,?,?,?,?,?,?,?,?,?)";
		jt.update(insertMember,mVO.getId(),mVO.getEmail(),mVO.getPass(),mVO.getEname_fst(),mVO.getEname_lst(),mVO.getKname(),mVO.getBirth_year()
				,mVO.getTel(),mVO.getReq_agree(),mVO.getOpt_agree());
		//4.������ �����̳� �ݱ�.
		gjt.closeAc();
	}//insertMember
	
	/**
	 * ���̵�� ��й�ȣ�� �Է¹޾� �̸��� ��ȸ�ϴ� ��.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String selectLogin(memberVO mVO)throws SQLException{
		String kname="";//�̸��� AES ��ȣȭ�Ǿ��ִ�.
		//1.Spring Container ���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String selectId="select kname from member where id=? and pass=?";
		kname=
			jt.queryForObject(selectId, new Object[] {mVO.getId(),mVO.getPass()},String.class );
		//4. Spring Container �ݱ�.
		gjt.closeAc();
		
		return kname;
	}
	/**
	 * ��й�ȣ�� �Է¹޾� �̸��� ��ȸ�ϴ� ��.
	 * @param mVO
	 * @return
	 * @throws SQLException
	 */
	public String selectPass(memberVO mVO)throws SQLException{
		String pass="";//�̸��� AES ��ȣȭ�Ǿ��ִ�.
		//1.Spring Container ���
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate ���
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3.������ ����.
		String selectpass="select pass from member where pass=?";
		pass=
			jt.queryForObject(selectpass, new Object[] {mVO.getPass()},String.class );
		//4. Spring Container �ݱ�.
		gjt.closeAc();
		
		return pass;
	}
	

}//class