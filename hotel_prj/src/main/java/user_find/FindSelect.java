package user_find;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import admin_member.MemberVO;
import team3_dao.GetJdbcTemplate;

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
	public String findId(MemberVO mVO) throws DataAccessException {
		String id="";
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		String selectPass = "select id from member where kname=? and email=?";
		id = jt.queryForObject(selectPass, new Object[] {mVO.getKname(), mVO.getEmail()}, String.class);
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return id;		
	}

	/**
	 * 이름과 아이디와 이메일로 비밀번호 찾기
	 * @param mVO
	 * @return
	 * @throws DataAccessException
	 */
	public String findPass(MemberVO mVO) throws DataAccessException {
		String pass="";
		
		//1. 스프링 컨테이너 생성
	      GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
	      // 이거 깃허브쓰시면 더 편하게 하실거에여. 깃허브에 DB연동정보 수정한거있으니까 그거 가져다가 쓰시면 풀패스로 패키지명 다 안써도돼영그리고 어차피 깃허브쓰기로했으니까 그거 쓰세여!
	      //2. JdbcTemplate 얻기
	      JdbcTemplate jt = gjt.getJdbcTemplate();
	      //3. 쿼리문 수행
	      String selectPass = "select pass from member where kname=? and id=? and email=?";
	      pass = jt.queryForObject(selectPass, new Object[] {mVO.getKname(), mVO.getId(), mVO.getEmail()}, String.class);
	      //4. 스프링컨테이너 닫기
	      gjt.closeAc();
	      
	      return pass;		
	}
	
	
}
