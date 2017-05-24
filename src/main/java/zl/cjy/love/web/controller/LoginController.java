package zl.cjy.love.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import zl.cjy.love.sys.SysContant;

@Controller
public class LoginController {

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = { "/login", "/" }, method = RequestMethod.GET)
	public String Login() {
		return "/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login() throws IOException {
		String password = request.getParameter("password");
		JSONObject result = new JSONObject();
		result.put("success", false);
		result.put("msg", "密码错误");
		if (SysContant.SYS_PASSWORD.equals(password)) {
			request.getSession().setAttribute("user", "Mr.C");
			result.put("success", true);
			result.put("msg", "登录成功");
		}
		return result;
	}

	@RequestMapping("/sys/logout")
	public String logout() {
		request.getSession().setAttribute("user", null);
		return "/login";
	}
}
