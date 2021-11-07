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
 * Ư�� ������ ����/������ �۾��ϴ� Ŭ����
 * @author user
 */
public class ReserveModify {

	/**
	 * Ư������� ���� method / update�� status N�� ����
	 * @param resNum ���õ� �����ȣ
	 * @return ���� ���� �� 1��ȯ
	 */
	public int deleteRes(String resNum) {
		int cnt = 0;
		
		// 1. Spring Container ���
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
			JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
			String deleteRes="update reservation 	set res_status='N'	where res_no=?";
			cnt = jt.update(deleteRes,resNum);
		//4. Spring Container �ݱ�
			gjt.closeAc();
			
		return cnt;
	}//deleteRes
	
	/*
	 * public static void main (String[] args) { ReserveModify rm = new
	 * ReserveModify(); int cnt = rm.deleteRes("1025R03"); System.out.println(cnt);
	 * }//test
	 */
	
	/**
	 * ���� ����� ���� �� ���� ������ ��ȸ�ϴ� method
	 * @param resNum
	 * @return
	 */
	public ReserveUpdateVO selectRes(String resNum){
		ReserveUpdateVO rVO= null;
			
		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
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
		// 4. Spring Container�ݱ�
		gjt.closeAc();	
		
		//üũ��.�ƿ� ��¥ �и��Ͽ� ����
		rVO.setInYear(rVO.getChkInDate().substring(0, 4));
		rVO.setInMonth(rVO.getChkInDate().substring(5, 7));
		rVO.setInDay(rVO.getChkInDate().substring(8, 10));
		rVO.setOutYear(rVO.getChkOutDate().substring(0, 4));
		rVO.setOutMonth(rVO.getChkOutDate().substring(5, 7));
		rVO.setOutDay(rVO.getChkOutDate().substring(8, 10));
		
		return rVO;
	}//selectRes
	
	/**
	 * ������� ȭ�鿡�� ����� ��� �� ����Ʈ�� max �ο��� ��ȸ
	 * @return
	 */
	public List<String> selectAllRName(){
		List<String> list = null;
		
		// 1. Spring Container ���
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		// 2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		// 3. ���� ����
		String select = "select r_name from room";
		list = jt.query(select, new RowMapper<String>() {
			public String mapRow(ResultSet rs,int rowNum)throws SQLException {
				String name = rs.getString("r_name");
				return name;
			}//mapRow
		});
		// 4. Spring Container�ݱ�
		gjt.closeAc();	
		
		return list;
	}//selectAllRName
	
	
	/*
	 * if(date.getYear()==null) { // �Է� ��¥�� ���ٸ� ���Ϸ� ��¥ ���� Calendar cal =
	 * Calendar.getInstance(); date.setYear(String.valueOf(cal.get(Calendar.YEAR)));
	 * date.setMonth(String.valueOf(cal.get(Calendar.MONTH)+1));
	 * date.setDay(String.valueOf(cal.get(Calendar.DAY_OF_MONTH))); }//end if
	 */	
	
}//class
