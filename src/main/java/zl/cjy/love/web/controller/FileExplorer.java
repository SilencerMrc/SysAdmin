package zl.cjy.love.web.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import zl.cjy.love.server.model.FileModel;

@RestController
@RequestMapping("/sys")
public class FileExplorer {

	private org.slf4j.Logger log = LoggerFactory.getLogger(FileExplorer.class);

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/file/tree")
	public List<FileModel> fileTree() {
		List<FileModel> fileModels = new ArrayList<>();
		String path = request.getParameter("path");
		if (StringUtils.isBlank(path)) {
			FileSystemView fsv = FileSystemView.getFileSystemView();
			File[] roots = File.listRoots();
			for (int i = 0; i < roots.length; i++) {
				FileModel fileModel = new FileModel();
				fileModel.setId(String.valueOf(i + 1));
				fileModel.setIsParent("true");
				fileModel.setName(fsv.getSystemDisplayName(roots[i]));
				fileModel.setPath(roots[i].getPath());
				fileModels.add(fileModel);
			}
		} else {
			File file = new File(path);
			File[] files = file.listFiles();
			if (files == null)
				return fileModels;
			for (int i = 0; i < files.length; i++) {
				if (files[i].isFile())
					continue;
				FileModel fileModel = new FileModel();
				fileModel.setId(String.valueOf(i + 1));
				fileModel.setIsParent("true");
				fileModel.setName(files[i].getName());
				fileModel.setPath(files[i].getPath());
				fileModels.add(fileModel);
			}
		}
		return fileModels;
	}

	@RequestMapping("/file/list")
	public List<FileModel> fileList() {
		List<FileModel> fileModels = new ArrayList<>();
		String path = request.getParameter("path");
		File file = new File(path);
		File[] files = file.listFiles();
		if(files == null)
			return fileModels;
		for (File f : files) {
			FileModel fileModel = new FileModel();
			if (f.isFile()) {
				fileModel.setName(f.getName());
				fileModel.setSortNum(2);
				fileModel.setSize(f.length() / 1024 + "KB");
				long time = f.lastModified();
				fileModel.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(time)));
				String fileName = f.getName();
				fileModel.setPath(f.getPath());
				String prefix = fileName.substring(fileName.lastIndexOf(".") + 1);
				fileModel.setType(prefix);
			} else {
				fileModel.setName(f.getName());
				fileModel.setSortNum(1);
				long time = f.lastModified();
				fileModel.setPath(f.getPath());
				fileModel.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(time)));
				fileModel.setType("floder");
				fileModel.setSize("");
			}
			fileModels.add(fileModel);
		}
		Collections.sort(fileModels, new Comparator<FileModel>() {

			@Override
			public int compare(FileModel o1, FileModel o2) {
				// TODO Auto-generated method stub
				return o1.getSortNum().compareTo(o2.getSortNum());
			}
		});
		return fileModels;
	}

}
