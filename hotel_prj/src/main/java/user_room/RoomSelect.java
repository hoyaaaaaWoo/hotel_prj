package user_room;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;




public class RoomSelect {
	
	
	/**
	 * �����ǳ� �����ϰ� �غ� �׽�Ʈ��,,,������ ������ �������� ���� ������
	 * @return
	 * @throws SQLException
	 */
	public List<Integer> selectAllRoomNo() throws SQLException{
		List<Integer> list = null;
		
		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		// 3. ��������
		String selectRoomNo = "select room_no from room";
		list = jt.query(selectRoomNo, new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Integer i = Integer.valueOf(rs.getInt("room_no"));
				return i;
			}//mapRow
		});
		
		// 4. Spring Container �ݱ�
		gjt.closeAc();
		
		return list;
	}//selectAllDeptno
	
	

	/**
	 * �������� ������
	 * @param room_no
	 * @return
	 * @throws SQLException
	 */
	public RoomVO selectRoomInfo( int room_no ) throws SQLException{
		RoomVO rv = null;
		
		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		// 3. ���� ����
		String select = "select r_name, description, bed_type, max_guest, r_size, chkin_time, chkout_time, r_view, "
				+ "amnt_gen, amnt_bath, amnt_other, main_img, price from room where room_no = ?";
		
		// interface�� anonymous inner class�� �����Ͽ� �� �ȿ��� ��ȸ����� VO�� �Ҵ�
		rv = jt.queryForObject(select, new Object[] { room_no }, 
				new RowMapper<RoomVO>() {
			public RoomVO mapRow(ResultSet rs, int rowNum) throws SQLException{
						RoomVO rv = new RoomVO();
						// ResultSet�� ����Ͽ� ��ȸ����� VO�� ����
						rv.setR_name(rs.getString("r_name"));
						rv.setDescription(rs.getString("description"));
						rv.setBed_type(rs.getString("bed_type"));
						rv.setMax_guest(rs.getInt("max_guest"));
						rv.setR_view(rs.getString("r_view"));
						rv.setR_size(rs.getString("r_size"));
						rv.setChkin_time(rs.getString("chkin_time"));
						rv.setChkout_time(rs.getString("chkout_time"));
						rv.setAmnt_gen(rs.getString("amnt_gen"));
						rv.setAmnt_bath(rs.getString("amnt_bath"));
						rv.setAmnt_other(rs.getString("amnt_other"));
						rv.setMain_img(rs.getString("main_img"));
						rv.setPrice(rs.getInt("price"));
						
						
						// ��ȸ����� ������ dv ��ȯ
						return rv;
					}
				});

		// 4. Spring Container �ݱ�
		gjt.closeAc();
		
		return rv;
	}
}//class
