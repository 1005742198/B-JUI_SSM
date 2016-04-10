package obob.dao;

import java.util.List;

import obob.bean.File;

public interface FileDao {
	public List<File> getFileList();
	public File getFileById(Integer id);
}
