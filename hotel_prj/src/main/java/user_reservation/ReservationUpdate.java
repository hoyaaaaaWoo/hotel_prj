package user_reservation;

import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

/**
 * ������ҽ�  ���� ���� Y  > N���� ����
 * @author user
 */
public class ReservationUpdate {

	public int reservationFlag(int res_no) {
		int cnt =0;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String deleteRes =  "update reservation set res_status='N' where res_no=?";
		cnt=jt.update(deleteRes,res_no);
		gjt.closeAc();
		
		return cnt;
	}//reservationFlag
	
	
	
	
	
}//ReservationUpdate
