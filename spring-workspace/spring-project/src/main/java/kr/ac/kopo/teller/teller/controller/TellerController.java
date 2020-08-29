package kr.ac.kopo.teller.teller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.client.user.service.UserService;
import kr.ac.kopo.client.user.vo.UserVO;
import kr.ac.kopo.teller.teller.service.TellerService;
import kr.ac.kopo.teller.teller.vo.TellerVO;

//@SessionAttributes("tellerVO")
@Controller
public class TellerController {
	
	@Autowired
	private TellerService tellerService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/teller")
	public String tellerMain() {
		return "/teller/index_teller";
	}
			
	
	@GetMapping("/teller/login")
	public String loginForm() {
		return "/teller/login/login";
	}
	
	@PostMapping("/teller/login")
	public ModelAndView login(TellerVO teller, HttpSession session ){
		
		TellerVO tellerVO = tellerService.login(teller);
		
		ModelAndView mav = new ModelAndView();
		
		
		if(tellerVO == null) {
			mav.setViewName("redirect:/teller/login");
		} else {
			mav.setViewName("redirect:/teller");
			//mav.addObject("tellerVO", tellerVO);
			session.setAttribute("tellerVO", tellerVO);
		}
		
		return mav;
	}
	
	@RequestMapping("/teller/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("tellerVO");
		
		return "redirect:/teller";
	}
	
	/*
	@RequestMapping("/teller/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/teller";
	}
	*/
	
	@RequestMapping("/teller/waitRoom")
	public String waitRoom() {
		return "/teller/waitRoom/waitRoom-teller";
	}
	
	/*
	@RequestMapping("/teller/bankCounter")
	public String bankCounter() {
		return "/teller/bankCounter/bankCounter-teller";
	}
	*/
	
	@PostMapping("/teller/bankCounter")
	public ModelAndView bankCounter(@RequestParam(name="userID") String id, @RequestParam(name="jobType") String type){
		
		ModelAndView mav = new ModelAndView();
		System.out.println("id : " + id);
		System.out.println("type : " + type);
		mav.setViewName("/teller/bankCounter/bankCounter-teller");
		
		UserVO client = userService.getUserInfo(id);
		
		mav.addObject("clientVO", client);
		mav.addObject("jobType", type);
		
		return mav;
	}
	
}
