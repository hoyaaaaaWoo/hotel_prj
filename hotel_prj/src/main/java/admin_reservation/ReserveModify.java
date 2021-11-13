package admin_reservation;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

/**
 * 특정 예약의 삭제/수정을 작업을 하는 클래스
 * @author user
 */
public class ReserveModify {

	/**
	 * 특정예약건 삭제 method / update로 status N로 변경
	 * @param resNum 선택된 에약번호
	 * @return 삭제 성공 시 1반환
	 */
	public int deleteRes(String resNum) throws DataAccessException {
		int cnt = 0;
		
		// 1. Spring Container 얻기
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
			String deleteRes="update reservation 	set res_status='N'	where res_no=?";
			cnt = jt.update(deleteRes,resNum);
		//4. Spring Container 닫기
			gjt.closeAc();
			
		return cnt;
	}//deleteRes
	
	/**
	 * 특정 예약건 수정 요청대로 update하는 method
	 * @param resNum 선택된 에약번호
	 * @return update 성공 시 1반환
	 */
	public int updateRes(ReserveUpdateVO ruVO) throws DataAccessException  {
		int cnt = 0;
		
		// 1. Spring Container 얻기
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
			StringBuilder sb = new StringBuilder();
			sb.append("update reservation		")
			.append("set    id = (select id from member where kname=? and m_status='Y'),")
			.append("		chkin_date = to_char(to_date(?),'yyyy.mm.dd'),")
			.append("		chkout_date = to_char(to_date(?),'yyyy.mm.dd'),")
			.append("		adult = ?, child = ?,")
			.append("		room_no = (select room_no from room where r_name=?),")
			.append("       add_req = ?		")
			.append("where  res_no=?	");
			
			cnt = jt.update(sb.toString(),ruVO.getkName(),ruVO.getChkInDate(),ruVO.getChkOutDate(),
					ruVO.getAdult(),ruVO.getChild(),ruVO.getrName(),ruVO.getAddReq(),ruVO.getResNo());
		//4. Spring Container 닫기
			gjt.closeAc();
			
		return cnt;
	}//updateRes
	
}//class
