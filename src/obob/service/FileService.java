package obob.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import obob.bean.File;
import obob.dao.FileDao;
@Service("FileService")
public class FileService {
	@Resource
	private FileDao fileDao;
	public File getFileById(Integer id){
		return fileDao.getFileById(id);
	}
	public List<File> getFileList(){
		return fileDao.getFileList();
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
