package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
	public String index() {
		return "index";
	}
	
	@RequestMapping("/form")
	public String form() {
		return "index/form";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String login(String userId, String password, HttpSession session){
		//userId에 해당하는 사용자를 데이터베이스에서 조회
		//사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인
		session.setAttribute("userId", userId);
		return "redirect:/";
	}
}
