package obob.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import obob.bean.File;
import obob.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	@Resource(name="fileServiceImpl")
	private FileService fileService;
	
	@RequestMapping(value="/showfile.do",method=RequestMethod.POST)
	public String getFileList(HttpServletRequest request,Model model){
		/*User userLogin=new User();
		userLogin.setUsername(request.getParameter("username"));
		userLogin.setPassword(request.getParameter("password"));
		*/
		List<File>list=new ArrayList<File>();
		list=fileService.getFileList();
		model.addAttribute("list", list);
		model.addAttribute("user", "obob");
		return "webapps/jsp/filelist.jsp";
	}
	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
}
