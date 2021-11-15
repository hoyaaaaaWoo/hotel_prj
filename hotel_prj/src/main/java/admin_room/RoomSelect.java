package admin_room;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

/**
 * 객실에 대한 정보를 조회하는 class
 * @author user
 */
public class RoomSelect {

	/**
	 * 예약변경시 사용할 
	 * 활성화된 객실 리스트 조회
	 * @return
	 */
	public List<String> selectAllRName() throws SQLException {
		List<String> list = null;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		String select = "select r_name from room where r_status='Y'";
		list = jt.query(select, new RowMapper<String>() {
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("r_name");
				return name;
			}// mapRow
		});
		// 4. Spring Container닫기
		gjt.closeAc();

		return list;
	}// selectAllRName

	/**
	 * 등록된 모든 room 상세정보 조회
	 * @return
	 */
	public List<RoomVO> selectRoomInfo(String rName, String rStatus) throws SQLException {
		List<RoomVO> roomList = null;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder("select * from room");
		
		//파라미터가 들어왔을 때 조건문 추가 
		if(rName!=null && rStatus !=null){
			select.append("		where	r_name='")
					.append(rName)
					.append("'	and	")
					.append("r_status='")
					.append(rStatus)
					.append("'");
		}//end if
		
		if (rName != null && rStatus == null) { 
			select.append("		where	r_name='")
			.append(rName)
			.append("'");
		} // end if
		
		if (rName == null && rStatus != null) { 
			select.append("		where	r_status='")
			.append(rStatus)
			.append("'");
		} // end if

		roomList = jt.query(select.toString(), new selectRoomInfo());

		// 4. Spring Container닫기
		gjt.closeAc();

		//room_no대로 정렬
		if(roomList!=null) {
		Collections.sort(roomList, new CompareRNoAsc());
		}
		
		return roomList;
	}// selectRoomInfo
	
	/* selectRoomInfo에서 조회된 객실 정보를 담을 inner class
	 * @author user
	 */
	public class selectRoomInfo implements RowMapper<RoomVO> {
		public RoomVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			RoomVO rmVO = new RoomVO();
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
			rmVO.setMoreInfo(rs.getString("more_info"));
			rmVO.setImg(rs.getString("main_img"));
			rmVO.setInputDate(rs.getString("input_date"));
			String price = new DecimalFormat("#,###").format(rs.getInt("price"));
			rmVO.setPrice(price);
			rmVO.setGuestNum(rs.getInt("max_guest"));
			
			return rmVO;
		}// mapRow

	}// selectRes
	
	/**
	 * List<RoomVO>에서 room no 순서대로 정렬하는 inner Class
	 * @author user
	 */
	public class CompareRNoAsc implements Comparator<RoomVO> {
		@Override
		public int compare(RoomVO o1, RoomVO o2) {
			return o1.getRoomNum().compareTo(o2.getRoomNum());
		}
	}// class
	
	/**
	 * images 테이블에서 룸별 이미지 조회
	 * @return
	 */
	public List<OtherImgVO> selectOtherImg(String rName) throws SQLException {
		List<OtherImgVO> imgList = null;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder();

		select.append(" 	select * 	from   images")
				.append(" 	where  room_no = (select room_no")
									.append(" 	 from room	")
									.append(" 	 where r_name=?)");	
		
			imgList = jt.query(select.toString(), new Object[] {rName}, 
					new RowMapper<OtherImgVO>() {
						public OtherImgVO mapRow(ResultSet rs, int rowNum) throws SQLException  {
							OtherImgVO imgVO = new OtherImgVO();
							imgVO.setImgNo(rs.getInt("img_no"));
							imgVO.setRoomNo(rs.getInt("room_no"));
							imgVO.setImgSrc(rs.getString("img_src"));
							return imgVO;
						}//mapRow
			});
			// 4. Spring Container닫기
		gjt.closeAc();
		
		return imgList;
	}// selectRoomInfo
	
	
	/**
	 * 객실 추가 시 가장 끝번호인 RoomNo를 조회하여 사용
	 * @return
	 */
	public int selectMaxRoomNo() {
		int num = 0;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();

		String selectMaxNo = "select max(room_no) from room where r_status='Y'";
		try {
		num = jt.queryForObject(selectMaxNo, Integer.class);
		}catch (EmptyResultDataAccessException erdae) {
			num = 0;
		}//end catch
		return num;
	}//selectMaxRoomNo
	
	
	/**
	 * 객실 수정 시, 중복 이름을 조회하는 일
	 * @return
	 */
	public List<String> selectRoomName(String rName, String roomNum) throws SQLException {
		List<String> list = null;

		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();

		String select = "select r_name from room where r_name=? and room_no!=?";
		
		list = jt.query(select, new Object[] {rName, roomNum}, new RowMapper<String>() {
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				String name = rs.getString("r_name");
				return name;
			}// mapRow
		});

		gjt.closeAc();

		return list;
	}// selectRoomName
	
}// class