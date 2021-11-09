package admin_room;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import admin_reservation.ReserveSelectVO;
import team3_dao.GetJdbcTemplate;

/**
 * ���ǿ� ���� ������ ��ȸ�ϴ� class
 * @author user
 */
public class RoomSelect {

	/**
	 * Ȱ��ȭ�� ���� ����Ʈ ��ȸ
	 * @return
	 */
	public List<String> selectAllRName() {
		List<String> list = null;

		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
		String select = "select r_name from room where r_status='Y'";
		list = jt.query(select, new RowMapper<String>() {
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("r_name");
				return name;
			}// mapRow
		});
		// 4. Spring Container�ݱ�
		gjt.closeAc();

		return list;
	}// selectAllRName

	/**
	 * ��ϵ� ��� room ������ ��ȸ
	 * 
	 * @return
	 */
	public List<RoomSelectVO> selectRoomInfo(String rName) {
		List<RoomSelectVO> roomList = null;

		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
		StringBuilder select = new StringBuilder("select * from room	");

		if (rName != null) { // ���� �̸��� ���Դٸ�, �ش� ���� ������ ��ȸ
			select.append("		where rName = '");
			select.append(rName);
			select.append("'");
		} // end if

		select.append("		order by  r_name");

		roomList = jt.query(select.toString(), new selectRoomInfo());

		// 4. Spring Container�ݱ�
		gjt.closeAc();

		return roomList;
	}// selectRoomInfo

	/* selectRoomInfo���� ��ȸ�� ���� ������ ���� inner class
	 * @author user
	 */
	public class selectRoomInfo implements RowMapper<RoomSelectVO> {
		public RoomSelectVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			RoomSelectVO rmVO = new RoomSelectVO();
			rmVO.setrStatus(rs.getString("r_status"));
			rmVO.setRoomNum(rs.getString("room_no"));
			rmVO.setRoomName(rs.getString("r_name"));
			rmVO.setMainDesc(rs.getString("description"));
			rmVO.setType(rs.getString("bed_type"));
			rmVO.setRoomSize(rs.getString("r_size"));
			rmVO.setView(rs.getString("r_view"));
			rmVO.setChkIn(rs.getString("chkin_time"));
			rmVO.setChkOut(rs.getString("chkout_time"));
			rmVO.setSpecialServ(rs.getString("service"));
			rmVO.setGeneralAmn(rs.getString("amnt_gen"));
			rmVO.setBathAmn(rs.getString("amnt_bath"));
			rmVO.setOtherAmn(rs.getString("amnt_other"));
			rmVO.setAddInfo(rs.getString("MORE_INFO"));
			rmVO.setImg(rs.getString("main_img"));
			rmVO.setInputDate(rs.getString("input_date"));
			rmVO.setPrice(rs.getInt("price"));
			rmVO.setGuestNum(rs.getInt("max_guest"));
			
			return rmVO;
		}// mapRow

	}// selectRes

}// class