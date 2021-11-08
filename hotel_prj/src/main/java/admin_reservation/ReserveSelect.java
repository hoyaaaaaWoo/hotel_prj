package admin_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

/**
 * 예약 조회를 수행하는 클래스
 * @author user
 */
public class ReserveSelect {

	/**
	 * 예약관리 페이지에서 보여질 예약 조회<br>
	 * 최근 예약일자부터 내림차순으로 조회
	 * @return
	 */
	public List<ReserveSelectVO> selectRes(ReserveDateVO date) throws SQLException{
		List<ReserveSelectVO> rsList = null;
		
		// 1. Spring Container 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. 쿼리 실행
		StringBuilder select = new StringBuilder();
		select.append("select	rs.res_status, rs.res_no, m.kname,")
				.append("		(rs.chkin_date || '-'|| rs.chkout_date) staydate,")
				.append("		(nvl(rs.adult,0) + nvl(rs.child,0)) guest, r.r_name		")
				.append("from   reservation rs, member m, room r		")
				.append("where  (rs.id = m.id and rs.room_no = r.room_no) and rs.res_status='Y' 	");
		
				if(date.getYear()!= null) { //일자가 입력되었다면 체크인 날짜로 where 절에 문구 추가
					select.append("and chkin_date = '") // year.month.day
					.append(date.getYear()).append(".")
					.append(date.getMonth()).append(".")
					.append(date.getDay()).append("'");
				}//end if
				
				
		select.append("		order by  res_date desc");
		rsList = jt.query(select.toString(), new selectRes());
		// 4. Spring Container닫기
		gjt.closeAc();
		return rsList;
	}// selectAllRes

	///////////////////////// 조회된 예약 정보를 담을 inner class/////////////////////////
	public class selectRes implements RowMapper<ReserveSelectVO> {
		public ReserveSelectVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReserveSelectVO rVO = new ReserveSelectVO();
			rVO.setResNo(rs.getString("res_no"));
			rVO.setkName(rs.getString("kname"));
			rVO.setStayDate(rs.getString("staydate"));
			rVO.setGuest(rs.getInt("guest"));
			rVO.setrName(rs.getString("r_name"));
			rVO.setResStauts(rs.getString("res_status"));
			return rVO;
		}// mapRow
		
	}//selectRes
	
//	public static void main (String[] args) {
//		ReserveSelect rs = new ReserveSelect();
//		try {
//			 Calendar cal = Calendar.getInstance();
//			 int nowYear = cal.get(Calendar.YEAR);
//			 int nowMonth = cal.get(Calendar.MONTH)+1;
//			 int nowDay = cal.get(Calendar.DAY_OF_MONTH);
//			 // 오늘을 체크인 일자로 투입하여 VO 생성
//			 ReserveDateVO date = new ReserveDateVO();
//			 date.setYear(String.valueOf(nowYear));
//			 date.setMonth(String.valueOf(nowMonth));
//			 date.setDay(String.format("%02d",nowDay));
//			
//			System.out.println(rs.selectRes(date));
//		} catch (SQLException e) {
//			e.printStackTrace();
//			
//		}//catch
//	}//main
	
}// class
