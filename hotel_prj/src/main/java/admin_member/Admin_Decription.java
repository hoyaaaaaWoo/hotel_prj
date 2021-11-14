package admin_member;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import kr.co.sist.util.cipher.DataDecrypt;

public class Admin_Decription {

	   /**
	    * 전체회원 조회 복호화
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 * @throws GeneralSecurityException
	 */
	public List<MemberVO> allDecryptMemberData() throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException{
		      List<MemberVO> list=null;
		      MemberSelect ms=new MemberSelect();
		       try {
		         list=ms.selectMember();
		         DataDecrypt dd=new DataDecrypt("AbcdEfgHiJkLmnOpQ");
		         for(MemberVO mVO : list) {
		            mVO.setKname( dd.decryption(mVO.getKname()));
		            mVO.setBirth_year( dd.decryption(mVO.getBirth_year()));
		            mVO.setEname_fst( dd.decryption(mVO.getEname_fst()));
		            mVO.setEname_lst(dd.decryption(mVO.getEname_lst()));
		            mVO.setTel(dd.decryption(mVO.getTel()));
		            mVO.setEmail(dd.decryption(mVO.getEmail()));
		         }//end for
		      }catch (SQLException e) {
		      }//catch
		         return list;
		      }//allDecryptMemberData
	
	
	/**
	 *  특정회원조회 복호화
	 * @param kname
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws GeneralSecurityException
	 * @throws SQLException
	 */
	public MemberVO DecryptSpecificMemberData(String kname) throws UnsupportedEncodingException,GeneralSecurityException ,SQLException{
		MemberVO mVO = null;
		MemberSelect ms = new MemberSelect();
		mVO= ms.selectSpecificMember(kname);
		DataDecrypt dd = new DataDecrypt("AbcdEfgHiJkLmnOpQ");
		  mVO.setId(mVO.getId());
		  mVO.setKname( dd.decryption(mVO.getKname()));
          mVO.setBirth_year( dd.decryption(mVO.getBirth_year()));
          mVO.setEname_fst( dd.decryption(mVO.getEname_fst()));
          mVO.setEname_lst(dd.decryption(mVO.getEname_lst()));
          mVO.setTel(dd.decryption(mVO.getTel()));
          mVO.setEmail(dd.decryption(mVO.getEmail()));
		return mVO;
	}//searchDecrtpy
	
	/**
	 * 탈퇴회원 조회
	 * @return
	 * @throws SQLException
	 * @throws UnsupportedEncodingException
	 * @throws GeneralSecurityException
	 */
	public List<MemberVO>  DecryptDeleteMemberData() throws SQLException,UnsupportedEncodingException,GeneralSecurityException {
		List<MemberVO> list = null;
		MemberDelete md = new MemberDelete();
		list=md.selectDeleteMember();
		DataDecrypt dd = new DataDecrypt("AbcdEfgHiJkLmnOpQ");
		for(MemberVO mVO:list) {
			mVO.setId(mVO.getId());
			mVO.setKname(dd.decryption(mVO.getKname()));
			mVO.setOut_date(mVO.getOut_date());
		}
		return list;
	}//DecryptDeleteMemberData
	
	
	/**
	 * 특정 탈퇴회원 조회
	 * @param kname
	 * @return
	 * @throws SQLException
	 * @throws UnsupportedEncodingException
	 * @throws GeneralSecurityException
	 */
	public MemberVO DecryptDeleteSearchData(String kname) throws SQLException,UnsupportedEncodingException,GeneralSecurityException{
	MemberVO mVO = null;
	MemberSelect ms = new MemberSelect();
	mVO=ms.selectSpecificMemberDelete(kname);
	DataDecrypt dd = new DataDecrypt("AbcdEfgHiJkLmnOpQ");
	mVO.setId(mVO.getId());
	mVO.setKname(dd.decryption(mVO.getKname()));
	mVO.setOut_date(mVO.getOut_date());
	return mVO;
	}//DecryptDeleteSearchData
	
	
}//class
