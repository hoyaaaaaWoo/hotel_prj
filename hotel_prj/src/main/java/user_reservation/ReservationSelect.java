package user_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
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
			rVO.setRes_no(rs.getString("res_no"));
			rVO.setChkin_date(rs.getString("chkin_date"));
			rVO.setChkout_date(rs.getString("chkout_date"));
			
			return rVO;
		}
	}//RowMapper

	
	/**
	 * 예약정보조회
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public List<ReservationVO> reservationChk(String res_no) throws SQLException {
		List<ReservationVO> list = null;
		//1. 스프링 컨테이너 생성
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		//2. JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		//3. 쿼리문 수행
		StringBuilder chkRes = new StringBuilder();
		chkRes.append("	select r.r_name, chkin_date, chkout_date, adult, child	")
		.append("	from room r, reservation res	")
		.append("	where r.room_no=res.room_no(+) and res.res_no=?	");	
		
		list=jt.query(chkRes.toString(),new chkRes(), new Object[] { res_no });
		
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

		
	 /**
	  * 예약자정보조회
	 * @param id
	 * @return
	 * @throws SQLException
	 */
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
				rVO.setCompany(rs.getString("company"));
				rVO.setVal_mm(rs.getString("val_mm"));
				rVO.setVal_yy(rs.getString("val_yy"));
				rVO.setTel(rs.getString("tel"));
				rVO.setEmail(rs.getString("email"));
				rVO.setCard_no(rs.getString("card_no"));
				
				return rVO;
				
			}
		}
	 
	 
	 
	 
	 
	 /**
	 * 금액
	 * @param rVO
	 * @return
	 * @throws DataAccessException
	 */
	public int pay(String pri) throws DataAccessException {
			Integer price=null;
			
			//1. 스프링 컨테이너 생성
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
			//2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
			//3. 쿼리문 수행  price가 string이에요?
			String selectPrice = "select r.price from room r where r.room_no in"
					+ "(select reser.room_no from reservation reser where reser.res_no=?)";//price 데이터형이 varchar2에요?
			price = jt.queryForObject(selectPrice, new Object[] { pri/*입력되는 파라메터*/ }, Integer.class);
			//4. 스프링컨테이너 닫기
			gjt.closeAc();
			
			return price.intValue();		
	}//pay
	
	 
	public ReservationVO reservation(String res_no) throws DataAccessException{
		ReservationVO rVO = null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		JdbcTemplate jt = gjt.getJdbcTemplate();
		String reser = "select r.r_name, reser.res_no, reser.chkin_date, reser.chkout_date, m.ename_fst, m.ename_lst, m.email, m.tel, "
				+ "reser.adult, reser.child, reser.id " 
				+ "from reservation reser, room r, member m "
				+ "where reser.room_no=r.room_no and reser.id=m.id and reser.res_no=?";
		rVO=jt.queryForObject(reser, new Object[] { res_no }, new RowMapper<ReservationVO>() {

			@Override
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO=new ReservationVO();
				//조회된 결과를 rVO에  setter method를 사용해서 넣습니다.		
				rVO.setR_name(rs.getString("r_name"));
				rVO.setRes_no(rs.getString("res_no"));
				rVO.setChkin_date(rs.getString("chkin_date"));
				rVO.setChkout_date(rs.getString("chkout_date"));
				rVO.setAdult(rs.getInt("adult"));
				rVO.setChild(rs.getInt("child"));
				/*
				 * rVO.setCard_no(rs.getString("card_no"));
				 * rVO.setCompany(rs.getString("company"));
				 * rVO.setVal_mm(rs.getString("val_mm")); rVO.setVal_yy(rs.getString("val_yy"));
				 */
				rVO.setId(rs.getString("id"));
				rVO.setEname_fst (rs.getString("ename_fst"));
				rVO.setEname_lst (rs.getString("ename_lst"));
				rVO.setEmail (rs.getString("email"));
				rVO.setTel(rs.getString("tel"));
				
				return rVO;
			}
			
		});
		gjt.closeAc();
		
		return rVO;
	}//reservation
	 
	
	
}
		
		
	

