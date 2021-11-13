package admin_room;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * �����߰� - �̹��� �߰����� ����� Ŭ����
 * 
 * @author user
 */
/**
 * @author user
 *
 */
public class UploadImgList {

	/**
	 * temp ���Ͽ� �����ϴ� �̹��� ��� ��ȸ
	 * 
	 * @return List<UploadImgVO>
	 */
	public List<UploadImgVO> searchImgList() {
		List<UploadImgVO> list = new ArrayList<UploadImgVO>();

		// 1. ���� ����Ʈ�� ������ ���� ����
		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		// 2. �ش� ������ ��� ����, ���丮�� ����
		File[] listFiles = temp.listFiles();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		
		UploadImgVO uliVO = null;
		for (File file : listFiles) {
			// 3. ���Ͽ� ���ؼ��� ������ ����
			if (file.isFile()) {
				// 4. list�� ���ϸ� �Ҵ�
				uliVO = new UploadImgVO();
				uliVO.setImgName(file.getName());
				uliVO.setImgLeng((int)((file.length())/1024));
				uliVO.setLastModified(sdf.format(new Date(file.lastModified())));
				list.add(uliVO);
			} // end if
		} // end for
		
		//��ϼ������ ����
		Collections.sort(list,new CompareDateDesc());

		return list;
	}// searchImgList

	
	/**
	 * List<UploadImgVO>���� ��ϼ������ �����ϴ� inner Class
	 * @author user
	 */
	public class CompareDateDesc implements Comparator<UploadImgVO>{
		@Override
		public int compare(UploadImgVO o1, UploadImgVO o2) {
			return o1.getLastModified().compareTo(o2.getLastModified());
		}
	}//class
	
	
	/**
	 * �����̹��� ��Ͻ� ���ϸ��� mainImg�� �����Ͽ� �����ϴ� method
	 */
	public void markMainImg(String fileName) {
		
		File selectedImgPath = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp/" + fileName);
		File mainImgPath = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp/" 
				+fileName.substring(0,fileName.indexOf("."))+"_main"+
				 fileName.substring(fileName.indexOf(".")));
		
		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		// ��ü ���� ����Ʈ ��ȸ �� main ���ԵǾ��ְų� ���� �̸����� ����Ǿ��ִ� ������ �ִٸ� ���� �� rename ó��
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
	 * temp ������ ��� �̹��� ����
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
	 * temp ������ Ư�� �̹����� ����
	 */
	public void removeSelectedImg(String fileName) {

		File temp = new File("C:/Users/user/git/hotel_prj/hotel_prj/src/main/webapp/temp");

		if (temp.exists()) {
			File[] listFiles = temp.listFiles();
			if (listFiles.length != 0) {
				for (int i = 0; i < listFiles.length; i++) {
					// �����Ϸ��� ���ϰ� ������ �̸��� �ִٸ� ����
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