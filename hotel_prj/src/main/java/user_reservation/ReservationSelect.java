package user_reservation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
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
		chkInq.append("	select reser.res_no, reser.chkin_date, reser.chkout_date, reser.res_status, r.r_name	")
		.append("	from reservation reser, room r	")
		.append("	where reser.room_no=r.room_no(+) and reser.id=?	");	
		
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
			rVO.setRes_status(rs.getString("res_status"));
			rVO.setR_name(rs.getString("r_name"));
			
			return rVO;
		}
	}//RowMapper

	
	 
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
			//3. 쿼리문 수행 
			String selectPrice = "select r.price from room r where r.room_no in"
					+ "(select reser.room_no from reservation reser where reser.res_no='"+ pri+"')";
			System.out.println( selectPrice +" / " +pri );
			price = jt.queryForObject(selectPrice,  Integer.class);
			//4. 스프링컨테이너 닫기
			gjt.closeAc();
			
			return price.intValue();		
	}//pay
	
	 
	public ReservationVO reservation(String res_no) throws DataAccessException{
		ReservationVO rVO = null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		JdbcTemplate jt = gjt.getJdbcTemplate();
		String reser = "select r.r_name,r.main_img, reser.res_no, reser.chkin_date, reser.chkout_date, m.ename_fst, m.ename_lst, m.email, m.tel, "
				+ "reser.adult, reser.child, reser.id  " 
				+ "from reservation reser, room r, member m "
				+ "where reser.room_no=r.room_no and reser.id=m.id and reser.res_no='"+ res_no+"'";	
		System.out.println( reser );
		rVO=jt.queryForObject(reser,  new RowMapper<ReservationVO>() {

			@Override
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rVO=new ReservationVO();
				//조회된 결과를 rVO에  setter method를 사용해서 넣습니다.		
				rVO.setR_name(rs.getString("r_name"));
				rVO.setMain_img(rs.getString("main_img"));
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
	
	public ReservationVO datePrice(String res_no) throws DataAccessException{
		ReservationVO rv = null;
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();  
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String dp ="select chkin_date, chkout_date, price "
				+ "from reservation reser, room r "
				+ "where reser.room_no=r.room_no and res_no='"+ res_no+"'";
		
		rv= jt.queryForObject(dp, new RowMapper<ReservationVO>() {

			@Override
			public ReservationVO mapRow(ResultSet rs, int rowCnt) throws SQLException {
				ReservationVO rv=new ReservationVO();
				//조회된 결과를 rVO에  setter method를 사용해서 넣습니다.		
				rv.setChkin_date(rs.getString("chkin_date"));
				rv.setChkout_date(rs.getString("chkout_date"));
				rv.setPrice(rs.getInt("price"));
				
				return rv;
			}
		
		});
		
		gjt.closeAc();
		
		return rv;
		
	}
	
	
	 
	
	/*
	 * public static void main(String[] args) { ReservationSelect t=new
	 * ReservationSelect(); System.out.println(t.reservation("20211118-001R03")); }
	 */
	 
	
	
}
		
		
	

