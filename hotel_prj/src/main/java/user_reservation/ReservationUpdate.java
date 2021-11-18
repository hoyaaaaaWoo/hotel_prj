package user_reservation;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

/**
 * 예약취소시  예약 상태 Y  > N으로 변경
 * @author user
 */
public class ReservationUpdate {

	public int reservationFlag(ReservationVO rVO) throws DataAccessException{
		int cnt =0;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String deleteRes =  "update reservation set res_status='N' where res_no=?";
		cnt=jt.update(deleteRes,rVO.getRes_no());
		gjt.closeAc();
		
		return cnt;
	}//reservationFlag
	
	
	
	
	
}//ReservationUpdate
