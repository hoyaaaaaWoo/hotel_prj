package admin_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

/**
 * ���� ��ȸ�� �����ϴ� Ŭ����
 * @author user
 */
public class ReserveSelect {

	/**
	 * ������� ���������� ������ ���� ��ȸ<br>
	 * �ֱ� �������ں��� ������������ ��ȸ
	 * @return
	 */
	public List<ReserveSelectVO> selectRes(ReserveDateVO date) throws SQLException{
		List<ReserveSelectVO> rsList = null;
		
		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
		StringBuilder select = new StringBuilder();
		select.append("select	rs.res_status, rs.res_no, m.kname,")
				.append("		(rs.chkin_date || '-'|| rs.chkout_date) staydate,")
				.append("		(nvl(rs.adult,0) + nvl(rs.child,0)) guest, r.r_name		")
				.append("from   reservation rs, member m, room r		")
				.append("where  (rs.id = m.id and rs.room_no = r.room_no) and rs.res_status='Y' 	");
		
				if(date.getYear()!= null) { //���ڰ� �ԷµǾ��ٸ� üũ�� ��¥�� where ���� ���� �߰�
					select.append("and chkin_date = '") // year.month.day
					.append(date.getYear()).append(".")
					.append(date.getMonth()).append(".")
					.append(date.getDay()).append("'");
				}//end if
				
				
		select.append("		order by  res_date desc");
		rsList = jt.query(select.toString(), new selectRes());
		// 4. Spring Container�ݱ�
		gjt.closeAc();
		return rsList;
	}// selectAllRes

	///////////////////////// ��ȸ�� ���� ������ ���� inner class/////////////////////////
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
//			 // ������ üũ�� ���ڷ� �����Ͽ� VO ����
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
