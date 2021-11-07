package admin_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import admin_reservation.ReserveSelect.selectRes;
import team3_dao.GetJdbcTemplate;

/**
 * 특정 예약의 삭제/수정을 작업하는 클래스
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
	
	/*
	 * public static void main (String[] args) { ReserveModify rm = new
	 * ReserveModify(); int cnt = rm.deleteRes("1025R03"); System.out.println(cnt);
	 * }//test
	 */
	
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
				.append("from   reservation rs, member m, room r	")
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
	 * 예약수정 화면에서 사용할 모든 룸 리스트와 max 인원수 조회
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
	
	
	/*
	 * if(date.getYear()==null) { // 입력 날짜가 없다면 당일로 날짜 설정 Calendar cal =
	 * Calendar.getInstance(); date.setYear(String.valueOf(cal.get(Calendar.YEAR)));
	 * date.setMonth(String.valueOf(cal.get(Calendar.MONTH)+1));
	 * date.setDay(String.valueOf(cal.get(Calendar.DAY_OF_MONTH))); }//end if
	 */	
	
}//class
