package admin_reservation;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import team3_dao.GetJdbcTemplate;

/**
 * 특정 예약의 삭제/수정을 작업 시 필요한 일을 하는 클래스
 * @author user
 */
public class ReserveModify {

	/**
	 * 특정예약건 삭제 method / update로 status N로 변경
	 * @param resNum 선택된 에약번호
	 * @return 삭제 성공 시 1반환
	 */
	public int deleteRes(String resNum) {
		int cnt = 0;
		
		// 1. Spring Container 얻기
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
			String deleteRes="update reservation 	set res_status='N'	where res_no=?";
			cnt = jt.update(deleteRes,resNum);
		//4. Spring Container 닫기
			gjt.closeAc();
			
		return cnt;
	}//deleteRes
	
	
	/**
	 * 선택 예약건 수정 전 기존 정보를 조회하는 method
	 * @param resNum
	 * @return
	 */
	public ReserveUpdateVO selectRes(String resNum){
		ReserveUpdateVO rVO= null;
			
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder();
		select.append("select rs.res_no, m.kname, rs.chkin_date, rs.chkout_date,")
				.append("		rs.adult, nvl(rs.child,0) child,")
				.append("		r.r_name, rs.add_req		")
				.append("from   reservation rs, member m, room r 	")
				.append("where  (rs.id = m.id and rs.room_no = r.room_no) and res_no=?");
		try {
		rVO = jt.queryForObject(select.toString(), new Object[] {resNum}, 
				new RowMapper<ReserveUpdateVO>() {
					public ReserveUpdateVO mapRow(ResultSet rs, int rowNum) throws SQLException  {
						ReserveUpdateVO rVO = new ReserveUpdateVO();
						rVO.setResNo(rs.getString("res_no"));
						rVO.setkName(rs.getString("kname"));
						rVO.setChkInDate(rs.getString("chkin_date"));
						rVO.setChkOutDate(rs.getString("chkout_date"));
						rVO.setAdult(rs.getInt("adult"));
						rVO.setChild(rs.getInt("child"));
						rVO.setrName(rs.getString("r_name"));
						rVO.setAddReq(rs.getString("add_req"));
						return rVO;
					}//mapRow
		});}catch(EmptyResultDataAccessException erdae) {
			return null;
		}//end catch
		// 4. Spring Container닫기
		gjt.closeAc();	
		
		//체크인.아웃 날짜 분리하여 저장
		rVO.setInYear(rVO.getChkInDate().substring(0, 4));
		rVO.setInMonth(rVO.getChkInDate().substring(5, 7));
		rVO.setInDay(rVO.getChkInDate().substring(8, 10));
		rVO.setOutYear(rVO.getChkOutDate().substring(0, 4));
		rVO.setOutMonth(rVO.getChkOutDate().substring(5, 7));
		rVO.setOutDay(rVO.getChkOutDate().substring(8, 10));
		
		return rVO;
	}//selectRes
	
	/**
	 * 예약수정 화면에서 사용할 모든 룸 리스트
	 * @return
	 */
	public List<String> selectAllRName(){
		List<String> list = null;
		
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		String select = "select r_name from room";
		list = jt.query(select, new RowMapper<String>() {
			public String mapRow(ResultSet rs,int rowNum)throws SQLException {
				String name = rs.getString("r_name");
				return name;
			}//mapRow
		});
		// 4. Spring Container닫기
		gjt.closeAc();	
		
		return list;
	}//selectAllRName
	
	/**
	 * 예약수정 프로세스에서 사용할 최대 객실인원 수 
	 * @return
	 */
	public int selectMaxGuest(String rName){
		int maxGuest=0;
		
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		String select = "select max_Guest from room where r_name=?";
		maxGuest = jt.queryForObject(select, new Object[] {rName},Integer.class);
		// 4. Spring Container닫기
		gjt.closeAc();	
		
		return maxGuest;
	}//selectAllRName
	

	/**
	 * 특정 예약건 수정 요청대로 update하는 method
	 * @param resNum 선택된 에약번호
	 * @return update 성공 시 1반환
	 */
	public int updateRes(ReserveUpdateVO ruVO) {
		int cnt = 0;
		
		// 1. Spring Container 얻기
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
			StringBuilder sb = new StringBuilder();
			sb.append("update reservation		")
			.append("set    id = (select id from member where kname=?),")
			.append("		chkin_date = ?, chkout_date = ?,")
			.append("		adult = ?, child = ?,")
			.append("		room_no = (select room_no from room where r_name=?),")
			.append("       add_req = ?		")
			.append("where  res_no=?");
			
			cnt = jt.update(sb.toString(),ruVO.getkName(),ruVO.getChkInDate(),ruVO.getChkOutDate(),
					ruVO.getAdult(),ruVO.getChild(),ruVO.getrName(),ruVO.getAddReq(),ruVO.getResNo());
		//4. Spring Container 닫기
			gjt.closeAc();
			
		return cnt;
	}//deleteRes
	
	
}//class
