package controller;

import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.User;
import service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService UserService;
	@ResponseBody
	@RequestMapping("quname.do")
	public int quname(User user,Model model) {
//		System.out.println(user);注册重名
		boolean quname = UserService.byName(user);
		return quname?1:0;
	}
	
	@RequestMapping("login.do")
	public String login(User user, Model model, HttpServletRequest rest, HttpServletResponse resp) {
		//登录
		int role = UserService.byNameps(user);
		String[] checkboxMe = rest.getParameterValues("rememberMe");
		String loginInfo = user.getUname() + "+" + user.getPasswd();
		if(role==0) {
//			model.addAttribute("message", "添加成功");
			model.addAttribute("byadmin", user);
			if(checkboxMe==null){
				Cookie newCookie = new Cookie("loginInfo", null);
				newCookie.setMaxAge(0);
				newCookie.setPath("/");
				resp.addCookie(newCookie);
			}else {
				if ("1".equals(checkboxMe[0])) {
					Cookie userCookie = new Cookie("loginInfo", loginInfo);
					userCookie.setMaxAge(1 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
					userCookie.setPath("/");
					resp.addCookie(userCookie);
				} else {
					Cookie newCookie = new Cookie("loginInfo", null);
					newCookie.setMaxAge(0);
					newCookie.setPath("/");
					resp.addCookie(newCookie);
				}
			}
			return "starter";
		}else if(role==1||role==2){
			model.addAttribute("byuser", user);
			if(checkboxMe==null){
				Cookie newCookie = new Cookie("loginInfo", null);
				newCookie.setMaxAge(0);
				newCookie.setPath("/");
				resp.addCookie(newCookie);
			}else {
				if ("1".equals(checkboxMe[0])) {
					Cookie userCookie = new Cookie("loginInfo", loginInfo);
					userCookie.setMaxAge(1 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
					userCookie.setPath("/");
					resp.addCookie(userCookie);
				} else {
					Cookie newCookie = new Cookie("loginInfo", null);
					newCookie.setMaxAge(0);
					newCookie.setPath("/");
					resp.addCookie(newCookie);
				}
			}
			return "userStarter";
		}else {
			return "login";
		}
	}
	//根据id删除
	@ResponseBody
	@RequestMapping("userDelete.do")
	public int delete(User user) {
		int i = UserService.userdelete(user.getUserId());
		return i;
	}
	//更新
	@ResponseBody
	@RequestMapping("userUpdate.do")
	public int update(User user) {
		int i = UserService.userupdate(user);
		return i;
	}
	
	@ResponseBody
	@RequestMapping("register.do")
	public int login(User user) {
		boolean rs = UserService.addUser(user);
		return rs?1:0;
	}
	
	
	@RequestMapping("userlist.do")
	public String userlist(Model model) {
		List<User> users = UserService.qu();
		model.addAttribute("users",users);
		return "userlist";
	}
	
	@RequestMapping("toLogin.do")
	public String toUser() {
		return "login";
	}
	//注册
	@RequestMapping("toRegister.do")
	public String toRegister() {
		return "register";
	}
	//忘记密码
	@RequestMapping("toForgot.do")
	public String toForgot() {
		return "forgot-password";
	}
	//详细电影页面
	@RequestMapping("bymovie.do")
	public String tobyuser() {
		return "bymovie";
	}
	
	
}
