package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.PappusMembership;

@Controller
public class MemberController {

	private MemberService service;

	@Autowired
	public void setService(MemberService service) {
		this.service = service;
	}

	@RequestMapping("/start.do")
	public String start() {
		return "start";
	}

	@RequestMapping(value = "/check_login.do", method = RequestMethod.POST)
	public String check_login(String id, String pw, HttpSession session) {
		if (service.loginCheck(id, pw) == 1) {
			session.setAttribute("loginId", id);
			return "memo/main";
		} else {
			return "member/login_fail";
		}
	}

	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}

	@RequestMapping("/complete.do")
	public ModelAndView complete(PappusMembership member) {
		int result = service.join(member);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join_complete");
		mv.addObject("result", result);

		return mv;
	}

	@RequestMapping("/confirmId.do")
	public ModelAndView confirmId(String id) {
		int result = service.confirmId(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/confirmId");
		mv.addObject("result", result);

		return mv;
	}

	@RequestMapping("/user_logout.do")
	public String user_logout() {
		return "member/user_logout";
	}

	@RequestMapping("/user_delete_check.do")
	public String user_delete_check() {
		return "member/user_delete_check";
	}

	@RequestMapping("/user_delete.do")
	public ModelAndView user_delete(String id, String pw) {
		int result = service.delete(id, pw);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/user_delete_result");
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping("/user_info_check.do")
	public String user_info_check(){
		return "member/user_info_check";
	}
	
	@RequestMapping("/user_info.do")
	public ModelAndView user_info(String id, String pw){
		PappusMembership result = service.userInfo(id,pw);
		ModelAndView mv = new ModelAndView();
		if(result != null){
			mv.setViewName("member/user_info");
			mv.addObject("userInfo",result);
		}else{
			mv.setViewName("member/user_info_check");
		}
		
		return mv;
	}
	
	@RequestMapping("/user_update.do")
	public ModelAndView user_update(PappusMembership member){
		int result = service.update(member);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/user_info_result");
		mv.addObject("result_update",result);
		
		return mv;
	}
	
}
