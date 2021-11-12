package user_reservation;

import java.util.Date;

public class ReservationVO {

	private int room_no, adult, child;
	private String res_no, id, chkin_date, chkout_date, add_req, cc_agree, pi_agree, res_status, r_name;
	private Date res_date;
	
	
	public ReservationVO() {
		
	}

	public ReservationVO(int room_no, int adult, int child, String res_no, String id, String chkin_date,
			String chkout_date, String add_req, String cc_agree, String pi_agree, String res_status, Date res_date) {
		super();
		this.room_no = room_no;
		this.adult = adult;
		this.child = child;
		this.res_no = res_no;
		this.id = id;
		this.chkin_date = chkin_date;
		this.chkout_date = chkout_date;
		this.add_req = add_req;
		this.cc_agree = cc_agree;
		this.pi_agree = pi_agree;
		this.res_status = res_status;
		this.res_date = res_date;
		this.r_name = r_name;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
	}

	public String getRes_no() {
		return res_no;
	}

	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChkin_date() {
		return chkin_date;
	}

	public void setChkin_date(String chkin_date) {
		this.chkin_date = chkin_date;
	}

	public String getChkout_date() {
		return chkout_date;
	}

	public void setChkout_date(String chkout_date) {
		this.chkout_date = chkout_date;
	}

	public String getAdd_req() {
		return add_req;
	}

	public void setAdd_req(String add_req) {
		this.add_req = add_req;
	}

	public String getCc_agree() {
		return cc_agree;
	}

	public void setCc_agree(String cc_agree) {
		this.cc_agree = cc_agree;
	}

	public String getPi_agree() {
		return pi_agree;
	}

	public void setPi_agree(String pi_agree) {
		this.pi_agree = pi_agree;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public Date getRes_date() {
		return res_date;
	}

	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	@Override
	public String toString() {
		return "ReservationVO [room_no=" + room_no + ", adult=" + adult + ", child=" + child + ", res_no=" + res_no
				+ ", id=" + id + ", chkin_date=" + chkin_date + ", chkout_date=" + chkout_date + ", add_req=" + add_req
				+ ", cc_agree=" + cc_agree + ", pi_agree=" + pi_agree + ", res_status=" + res_status + ", r_name="
				+ r_name + ", res_date=" + res_date + "]";
	}
	
	

	
	
	
	
}
