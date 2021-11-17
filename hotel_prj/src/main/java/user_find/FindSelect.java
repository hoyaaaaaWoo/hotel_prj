package user_find;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import admin_member.MemberVO;
import kr.co.sist.util.cipher.DataEncrypt;
import team3_dao.GetJdbcTemplate;
import user_reservation.ReservationVO;

/**
 * ���̵�� ��й�ȣ ã��
 * 
 * @author user
 *
 */
public class FindSelect {

	/**
	 * �̸��� �̸��Ϸ� ���̵� ã��
	 * @param kname
	 * @param email
	 * @return
	 * @throws DataAccessException
	 */
	public String findId(String kname, String email) throws DataAccessException {
		String id = null;

		String enKname = null;
		String enEmail = null;
		
		try {
			DataEncrypt de = new DataEncrypt("AbcdEfgHiJkLmnOpQ");
			enKname = de.encryption(kname);
			enEmail = de.encryption(email);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();

		String selectId = "select id from member where kname=? and email=?";
		id = jt.queryForObject(selectId, new Object[] { enKname, enEmail }, String.class);

		gjt.closeAc();

		return id;
	}//findId

	/**
	 * �̸��� ���̵�� �̸��Ϸ� ����� ���� �� �ӽ� ��й�ȣ �Ҵ�
	 * @param fVO
	 * @return
	 * @throws DataAccessException
	 */
	public String findPass(FindVO fVO) throws DataAccessException {
		String tempPass= null;
		
		String id = fVO.getId();
		
		String enKname = null;
		String enEmail = null;
		try {
			DataEncrypt de = new DataEncrypt("AbcdEfgHiJkLmnOpQ");
			enKname = de.encryption(fVO.getKname());
			enEmail = de.encryption(fVO.getEmail());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String selectJoin = "select join_date from member where id=? and kname=? and email=?";
		
		String joinDate 
			 = jt.queryForObject(selectJoin, new Object[] {id, enKname, enEmail }, String.class);
		
		if(joinDate !=null) {//��ȸ ����� �ִٸ� �ӽ� ��й�ȣ ��ȯ
			String[] tempArr="0,1,2,3,4,5,6,7,8,9,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m".split(","); 
			
			/*
			 * for(int i = 0; i <tempArr.length ; i++) {
			 * 
			 * }//end for
			 */			
		}//end if
		
		gjt.closeAc();

		return tempPass;
	}//findPass

	public static void main(String[] args) {
		FindSelect fs = new FindSelect();
		FindVO fv = new FindVO();
		fv.setEmail("min369@kakao.com");
		fv.setKname("������");
		fv.setId("kim");
		System.out.println(fs.findPass(fv));
		
		System.out.println(Math.random()/10);
		;
	}//
	
}//class
