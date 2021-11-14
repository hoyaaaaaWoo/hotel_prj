package admin_room;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import team3_dao.GetJdbcTemplate;

/**
 * ���� ���� ������ �����ϴ� Ŭ����
 * @author user
 */
public class RoomModify {

	/**
	 * ���� ���� ����
	 * @param statusRNo ��ѹ�
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
