package admin_room;

/**
 * 룸 조회에 사용할 VO
 * @author user
 */
public class RoomSelectVO {
	
private String rStatus, roomNum, roomName, mainDesc, type, roomSize, view, chkIn, chkOut,
			specialServ,generalAmn, bathAmn, otherAmn, addInfo, img, inputDate;
private int price, guestNum;

public RoomSelectVO() {
}


public RoomSelectVO(String rStatus, String roomNum, String roomName, String mainDesc, String type, String roomSize,
		String view, String chkIn, String chkOut, String specialServ, String generalAmn, String bathAmn,
		String otherAmn, String addInfo, String img, String inputDate, int price, int guestNum) {
	this.rStatus = rStatus;
	this.roomNum = roomNum;
	this.roomName = roomName;
	this.mainDesc = mainDesc;
	this.type = type;
	this.roomSize = roomSize;
	this.view = view;
	this.chkIn = chkIn;
	this.chkOut = chkOut;
	this.specialServ = specialServ;
	this.generalAmn = generalAmn;
	this.bathAmn = bathAmn;
	this.otherAmn = otherAmn;
	this.addInfo = addInfo;
	this.img = img;
	this.inputDate = inputDate;
	this.price = price;
	this.guestNum = guestNum;
}


public String getRoomNum() {
	return roomNum;
}


public void setRoomNum(String roomNum) {
	this.roomNum = roomNum;
}


public String getrStatus() {
	return rStatus;
}

public void setrStatus(String rStatus) {
	this.rStatus = rStatus;
}

public String getRoomName() {
	return roomName;
}

public void setRoomName(String roomName) {
	this.roomName = roomName;
}

public String getMainDesc() {
	return mainDesc;
}

public void setMainDesc(String mainDesc) {
	this.mainDesc = mainDesc;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getRoomSize() {
	return roomSize;
}

public void setRoomSize(String roomSize) {
	this.roomSize = roomSize;
}

public String getView() {
	return view;
}

public void setView(String view) {
	this.view = view;
}

public String getChkIn() {
	return chkIn;
}

public void setChkIn(String chkIn) {
	this.chkIn = chkIn;
}

public String getChkOut() {
	return chkOut;
}

public void setChkOut(String chkOut) {
	this.chkOut = chkOut;
}

public String getSpecialServ() {
	return specialServ;
}

public void setSpecialServ(String specialServ) {
	this.specialServ = specialServ;
}

public String getGeneralAmn() {
	return generalAmn;
}

public void setGeneralAmn(String generalAmn) {
	this.generalAmn = generalAmn;
}

public String getBathAmn() {
	return bathAmn;
}

public void setBathAmn(String bathAmn) {
	this.bathAmn = bathAmn;
}

public String getOtherAmn() {
	return otherAmn;
}

public void setOtherAmn(String otherAmn) {
	this.otherAmn = otherAmn;
}

public String getAddInfo() {
	return addInfo;
}

public void setAddInfo(String addInfo) {
	this.addInfo = addInfo;
}

public String getImg() {
	return img;
}

public void setImg(String img) {
	this.img = img;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public int getGuestNum() {
	return guestNum;
}

public void setGuestNum(int guestNum) {
	this.guestNum = guestNum;
}


public String getInputDate() {
	return inputDate;
}


public void setInputDate(String inputDate) {
	this.inputDate = inputDate;
}

}//class
