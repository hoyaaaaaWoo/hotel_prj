package user_room;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;




public class RoomSelect {
	
	
	/**
	 * 연동되나 간단하게 해본 테스트용,,,언젠간 쓸일이 있을지도 몰라서 안지움
	 * @return
	 * @throws SQLException
	 */
	public List<Integer> selectAllRoomNo() throws SQLException{
		List<Integer> list = null;
		
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		// 3. 쿼리실행
		String selectRoomNo = "select room_no from room";
		list = jt.query(selectRoomNo, new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Integer i = Integer.valueOf(rs.getInt("room_no"));
				return i;
			}//mapRow
		});
		
		// 4. Spring Container 닫기
		gjt.closeAc();
		
		return list;
	}//selectAllDeptno
	
	

	/**
	 * 객실정보 얻어오기
	 * @param room_no
	 * @return
	 * @throws SQLException
	 */
	public RoomVO selectRoomInfo( int room_no ) throws SQLException{
		RoomVO rv = null;
		
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		// 3. 쿼리 실행
		String select = "select r_name, description, bed_type, max_guest, r_size, chkin_time, chkout_time, r_view, "
				+ "amnt_gen, amnt_bath, amnt_other, main_img, price from room where room_no = ?";
		
		// interface를 anonymous inner class로 생성하여 그 안에서 조회결과를 VO에 할당
		rv = jt.queryForObject(select, new Object[] { room_no }, 
				new RowMapper<RoomVO>() {
			public RoomVO mapRow(ResultSet rs, int rowNum) throws SQLException{
						RoomVO rv = new RoomVO();
						// ResultSet을 사용하여 조회결과를 VO에 저장
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
						
						
						// 조회결과를 저장한 dv 반환
						return rv;
					}
				});

		// 4. Spring Container 닫기
		gjt.closeAc();
		
		return rv;
	}
}//class
