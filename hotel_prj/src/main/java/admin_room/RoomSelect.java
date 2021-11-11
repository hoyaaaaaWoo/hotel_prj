package admin_room;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
	 * 활성화된 객실 리스트 조회
	 * @return
	 */
	public List<String> selectAllRName() {
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
	public List<RoomSelectVO> selectRoomInfo(String rName) {
		List<RoomSelectVO> roomList = null;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder("select * from room");

		if (rName != null) { // 객실 이름이 들어왔다면, 해당 객실 정보만 조회
			select.append(" 	where r_Name = '");
			select.append(rName);
			select.append("'");
		} // end if

		select.append("		order by  r_name");

		roomList = jt.query(select.toString(), new selectRoomInfo());

		// 4. Spring Container닫기
		gjt.closeAc();

		return roomList;
	}// selectRoomInfo

	/* selectRoomInfo에서 조회된 객실 정보를 담을 inner class
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
			rmVO.setAddInfo(rs.getString("more_info"));
			rmVO.setImg(rs.getString("main_img"));
			rmVO.setInputDate(rs.getString("input_date"));
			String price = new DecimalFormat("#,###").format(rs.getInt("price"));
			rmVO.setPrice(price);
			rmVO.setGuestNum(rs.getInt("max_guest"));
			
			return rmVO;
		}// mapRow

	}// selectRes

	
	/**
	 * images 테이블에서 룸별 이미지 조회
	 * @return
	 */
	public List<OtherImgVO> selectOtherImg(String rName) {
		List<OtherImgVO> imgList = null;

		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder();

		select.append(" 	select * "
				+ "")
				.append(" 	from   images")
				.append(" 	where  room_no = (select room_no")
									.append(" 	 from room	")
									.append(" 	 where r_name=?)");	
		
		try {
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
		}catch (EmptyResultDataAccessException erdae) {
			return null;
		}finally {
			// 4. Spring Container닫기
			gjt.closeAc();
		}//end fin
		return imgList;
	}// selectRoomInfo
	
}// class