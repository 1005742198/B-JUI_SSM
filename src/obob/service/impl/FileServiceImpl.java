package obob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import obob.bean.File;
import obob.dao.FileDao;
import obob.service.FileService;
	@Service("fileServiceImpl")
	public class FileServiceImpl implements FileService{
		@Autowired
		private FileDao fileDao;
		public File getFileById(Integer id){
			return this.fileDao.getFileById(id);
		}
		public List<File> getFileList(){
			return this.fileDao.getFileList();
		}
	}
