package user_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import team3_dao.GetJdbcTemplate;

public class ReservationSelect {

	public List<ReservationVO> reservationChk(ReservationVO rVO) throws DataAccessException {
		List<ReservationVO> list = null;
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select r.r_name, chkin_date, choute_date, adult, child	")
		.append("	from room r, reservation res	")
		.append("	where r.room_no=res.room_no(+) and res.id=?	");	
		
		list=jt.query(chkRes.toString(), new Object[] {},
				new RowMapper<ReservationVO>() {
			
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO= new ReservationVO();
				rVO.setR_name(rs.getString("r_name"));
				rVO.setChkin_date(rs.getString("checkin"));
				rVO.setChkout_date(rs.getString("checkout"));
				rVO.setAdult(rs.getInt("adult"));
				rVO.setChild(rs.getInt("child"));
				
				return rVO;
			}
		});
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return list;
		
	}
	
	public List<ReservationVO> reserWhoChk (String id) throws DataAccessException {
		List<ReservationVO> list = null;
		
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select m.ename_lst, m.ename_fst,ci.company, ci.val_mm, ci.val_yy, m.tel, m.email, ci.card_no	")
		.append("	from member m, card_info ci	")
		.append("	where m.id = ci.id  and m.id=?	");	//like할때는 bind변수와 like의 특수문자를 문자로 처리하여 붙인다 like '%'||?||'%'
		
		list=jt.query(chkRes.toString(), new Object[] {id},
				new RowMapper<ReservationVO>() {
			
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
		});
		
		//4. 스프링컨테이너 닫기
		gjt.closeAc();
		
		return list;		
	}
	
}
