package user_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

public class ReservationSelect {

	public List<ReservationVO> reservationChk (String id) throws DataAccessException {
		List<ReservationVO> list = null;
		
		//1. ������ �����̳� ����
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. ������ ����
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select r.r_name, chkin_date, choute_date, adult, child	")
		.append("	from room r, reservation res	")
		.append("	where r.room_no=res.room_no(+) and res.id=?	");	//like�Ҷ��� bind������ like�� Ư�����ڸ� ���ڷ� ó���Ͽ� ���δ� like '%'||?||'%'
		
		list=jt.query(chkRes.toString(), new Object[] {id},
				new RowMapper<ReservationVO>() {

					public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
						ReservationVO rVO= new ReservationVO();
						rVO.setR_name(rs.getString("r_name"));
						rVO.setChkin_date(rs.getString("checkin"));
						rVO.setChkout_date(rs.getString("checkout"));
						
						return rVO;
					}
			});
		
		//4. �����������̳� �ݱ�
		gjt.closeAc();
		
		return list;		
	}
	
	public List<ReservationVO> reserWhoChk (String id) throws DataAccessException {
		List<ReservationVO> list = null;
		
		//1. ������ �����̳� ����
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate ���
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. ������ ����
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select r.r_name, chkin_date, choute_date, adult, child	")
		.append("	from room r, reservation res	")
		.append("	where r.room_no=res.room_no(+) and res.id=?	");	//like�Ҷ��� bind������ like�� Ư�����ڸ� ���ڷ� ó���Ͽ� ���δ� like '%'||?||'%'
		
		list=jt.query(chkRes.toString(), new Object[] {id},
				new RowMapper<ReservationVO>() {
			
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO= new ReservationVO();
				rVO.setR_name(rs.getString("r_name"));
				rVO.setChkin_date(rs.getString("checkin"));
				rVO.setChkout_date(rs.getString("checkout"));
				
				return rVO;
			}
		});
		
		//4. �����������̳� �ݱ�
		gjt.closeAc();
		
		return list;		
	}
	
}
