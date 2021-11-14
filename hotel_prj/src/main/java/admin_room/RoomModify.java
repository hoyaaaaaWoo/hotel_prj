package admin_room;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

/**
 * 객실 정보 변경을 수행하는 클래스
 * @author user
 */
public class RoomModify {

	/**
	 * 객실 상태 변경
	 * @param statusRNo 룸넘버
	 * @param rStatus Y | N
	 * @return
	 */
	public int RoomStatusUpdate(String statusRNo, String rStatus) throws DataAccessException {
		int cnt = 0;

		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		StringBuilder updateStatus = new StringBuilder();
		updateStatus.append("update 	room		")
				.append(" set   r_status=?	")
				.append(" where 	room_no=?");

		cnt = jt.update(updateStatus.toString(), rStatus, statusRNo);

		gjt.closeAc();

		return cnt;
	}// RoomStatusUpdate

}// class
