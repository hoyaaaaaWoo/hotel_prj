package admin_room;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * 객실추가 - 이미지 추가에서 사용할 클래스
 * 
 * @author user
 */
/**
 * @author user
 *
 */
public class UploadImgList {

	/**
	 * temp 파일에 존재하는 이미지 목록 조회
	 * 
	 * @return List<UploadImgVO>
	 */
	public List<UploadImgVO> searchImgList() {
		List<UploadImgVO> list = new ArrayList<UploadImgVO>();

		// 1. 파일 리스트를 가져올 파일 생성
		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		// 2. 해당 폴더의 모든 파일, 디렉토리를 얻음
		File[] listFiles = temp.listFiles();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		
		UploadImgVO uliVO = null;
		for (File file : listFiles) {
			// 3. 파일에 대해서만 정보를 얻음
			if (file.isFile()) {
				// 4. list에 파일명 할당
				uliVO = new UploadImgVO();
				uliVO.setImgName(file.getName());
				uliVO.setImgLeng((int)((file.length())/1024));
				uliVO.setLastModified(sdf.format(new Date(file.lastModified())));
				list.add(uliVO);
			} // end if
		} // end for
		
		//등록순서대로 정렬
		Collections.sort(list,new CompareDateDesc());

		return list;
	}// searchImgList

	
	/**
	 * List<UploadImgVO>에서 등록순서대로 정렬하는 inner Class
	 * @author user
	 */
	public class CompareDateDesc implements Comparator<UploadImgVO>{
		@Override
		public int compare(UploadImgVO o1, UploadImgVO o2) {
			return o1.getLastModified().compareTo(o2.getLastModified());
		}
	}//class
	
	
	/**
	 * 메인이미지 등록시 파일명을 mainImg로 변경하여 저장하는 method
	 */
	public void markMainImg(String fileName) {
		
		File selectedImgPath = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp/" + fileName);
		File mainImgPath = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp/" 
				+fileName.substring(0,fileName.indexOf("."))+"_main"+
				 fileName.substring(fileName.indexOf(".")));
		
		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		// 전체 파일 리스트 조회 후 main 포함되어있거나 같은 이름으로 저장되어있는 파일이 있다면 삭제 후 rename 처리
		File[] listFiles = temp.listFiles();

		for (File file : listFiles) {
			if (file.isFile() && file.getName().contains("_main")) {
				File delFile = new File(temp+"/"+file.getName());
				delFile.delete();
				break;
			} // end if
		} // end for
		
		selectedImgPath.renameTo(mainImgPath);
	}// markMainImg
	
	
	/**
	 * temp 폴더의 모든 이미지 삭제
	 */
	public void removeAllImg() {

		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		if (temp.exists()) {
			File[] listFiles = temp.listFiles();

			if (listFiles.length != 0) {
				for (int i = 0; i < listFiles.length; i++) {
					listFiles[i].delete();
				} // end for
			} // end if
		} // end if
	}// removeAllImg

	
	/**
	 * temp 폴더의 특정 이미지만 삭제
	 */
	public void removeSelectedImg(String fileName) {

		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		if (temp.exists()) {
			File[] listFiles = temp.listFiles();
			if (listFiles.length != 0) {
				for (int i = 0; i < listFiles.length; i++) {
					// 삭제하려는 파일과 동일한 이름이 있다면 삭제
					if (listFiles[i].getName().equals(fileName)) {
						File delImg = new File(temp + "/" + fileName);
						delImg.delete();
						break;
					} // end if
				} // end for
			} // end if
		} // end if
	}// removeSelectedImg


}// class