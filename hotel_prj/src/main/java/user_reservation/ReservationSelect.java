package user_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

public class ReservationSelect {
	
	public List<ReservationVO> reserInq(String id) throws SQLException {
		List<ReservationVO> list = null;
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkInq = new StringBuilder();
		chkInq.append("	select res_no, chkin_date, chkout_date	")
		.append("	from reservation	")
		.append("	where id=?	");	
		
		list=jt.query(chkInq.toString(),new chkInq(), new Object[] { id });
		
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return list;
		
	}//reserInq
	public class chkInq implements RowMapper<ReservationVO>{
		public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
			ReservationVO rVO= new ReservationVO();
			rVO.setR_name(rs.getString("res_no"));
			rVO.setChkin_date(rs.getString("chkin_date"));
			rVO.setChkout_date(rs.getString("chkout_date"));
			
			return rVO;
		}
	}//RowMapper

	
	public List<ReservationVO> reservationChk(String id) throws SQLException {
		List<ReservationVO> list = null;
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select r.r_name, chkin_date, chkout_date, adult, child	")
		.append("	from room r, reservation res	")
		.append("	where r.room_no=res.room_no(+) and res.id=?	");	
		
		list=jt.query(chkRes.toString(),new chkRes(), new Object[] { id });
		
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return list;
		
		}//reservationChk
			
		public class chkRes implements RowMapper<ReservationVO>{
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO= new ReservationVO();
				rVO.setR_name(rs.getString("r_name"));
				rVO.setChkin_date(rs.getString("checkin"));
				rVO.setChkout_date(rs.getString("checkout"));
				rVO.setAdult(rs.getInt("adult"));
				rVO.setChild(rs.getInt("child"));
				
				return rVO;
			}
		}
		
	 
	
	
	 public List<ReservationVO> reserWhoChk (String id) throws SQLException {
		List<ReservationVO> list = null;
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkWho = new StringBuilder();
		chkWho.append("	select m.ename_lst, m.ename_fst,ci.company, ci.val_mm, ci.val_yy, m.tel, m.email, ci.card_no	")
		.append("	from member m, card_info ci	")
		.append("	where m.id = ci.id  and m.id=?	");
		
		list=jt.query(chkWho.toString(), new chkRes(), new Object[] {id});
			
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return list;
		}//reserWhoChk
	 
	 public class chkWho implements RowMapper<ReservationVO>{
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO= new ReservationVO();
				rVO.setEname_lst(rs.getString("ename_lst"));
				rVO.setEname_fst(rs.getString("ename_fst"));
				rVO.setCompany(rs.getString("id"));
				rVO.setVal_mm(rs.getInt("val_mm"));
				rVO.setVal_yy(rs.getInt("val_yy"));
				rVO.setTel(rs.getString("tel"));
				rVO.setEmail(rs.getString("email"));
				rVO.setCard_no(rs.getString("card_no"));
				
				return rVO;
				
			}
		}
}
		
		
	

