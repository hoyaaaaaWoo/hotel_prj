package kr.co.sist.admin.reservation;

/**
 * ������ȸ ���� �� ����� VO
 * @author user
 */
public class ReserveSelectVO {

	private String resNo, kName, stayDate, rName, resStauts, resDate;
	private int guest;

	public ReserveSelectVO() {
	}

	public ReserveSelectVO(String resNo, String kName, String stayDate, String rName, String resStauts, String resDate,
			int guest) {
		this.resNo = resNo;
		this.kName = kName;
		this.stayDate = stayDate;
		this.rName = rName;
		this.resStauts = resStauts;
		this.resDate = resDate;
		this.guest = guest;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public String getkName() {
		return kName;
	}

	public void setkName(String kName) {
		this.kName = kName;
	}

	public String getStayDate() {
		return stayDate;
	}

	public void setStayDate(String stayDate) {
		this.stayDate = stayDate;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getResStauts() {
		return resStauts;
	}

	public void setResStauts(String resStauts) {
		this.resStauts = resStauts;
	}

	public int getGuest() {
		return this.guest;
	}

	public void setGuest(int guest) {
		this.guest = guest;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

}// class
