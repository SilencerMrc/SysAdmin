package zl.cjy.love.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys")
public class PageController {
	
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/index")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/home")
	public String home(){
		return "/sys/home";
	}

	@RequestMapping("/fileExplorer")
	public String fileExplorer(Model model) {
		String id = request.getParameter("id");
		model.addAttribute("id", id);
		return "/sys/fileExplorer";
	}
}
