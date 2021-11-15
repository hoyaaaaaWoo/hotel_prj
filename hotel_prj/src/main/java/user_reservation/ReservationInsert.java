package user_reservation;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;



public class ReservationInsert {

	public int insertRes ( ReservationVO rsVO ) throws DataAccessException{
		int cnt = 0;
		
		// 1. GetJdbcTemplate ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance(); // JdbcTemplate ����
				
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		// ����
		String insertRes = "insert into reservation (res_no, id, room_no, adult, child, "
				+ "chkin_date, chkout_date, add_req, cc_agree, pi_agree, res_date, res_status)"
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, 'Y' )";
		
		// ������ ����
		cnt = jt.update(insertRes, rsVO.getRes_no(), rsVO.getId(), rsVO.getRoom_no(), rsVO.getAdult(),
				rsVO.getChild(), rsVO.getChkin_date(), rsVO.getChkout_date(), rsVO.getAdd_req(), rsVO.getCc_agree(),
				rsVO.getPi_agree());
		
		// 4. ���� ����
		gjt.closeAc();
				
		return cnt;
	}//insertRes
}//class
