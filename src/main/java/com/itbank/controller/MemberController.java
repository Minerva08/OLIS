package com.itbank.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.mail.Hash;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {

    @Autowired private MemberService ms;
    @Autowired private Hash hash;

    @GetMapping("/member/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    @GetMapping("/member/login")
    public void getlogin() { };

    @GetMapping("/member/join")
    public void getjoin() { }

    @GetMapping("/member/find_email")
    public void getfind_email() { }
    
    @GetMapping("/member/find_pw")
    public void getfind_pw() { }

    @PostMapping("/member/login")
    public ModelAndView login(MemberDTO dto, HttpSession session) {
      ModelAndView mav = new ModelAndView("/home");
      String hashed = hash.getHash(dto.getUser_pw());
  	  dto.setUser_pw(hashed);
      MemberDTO login = ms.isMember(dto);
   
      if(login.getGrade().equals("admin")) {
        mav.addObject("admin", 1);
        session.setAttribute("login", login);
  	  }
	      
      	else if(!login.getGrade().equals("admin")){
      		mav.addObject("admin", 0);
            session.setAttribute("login", login);
        }
	  	else {
	    	  mav.setViewName("/member/login");
	    	  mav.addObject("msg", "이메일 또는 비밀번호를 확인해 주세요");
	    }
        return mav;
    }

    @PostMapping("/member/join")
    public ModelAndView join(MemberDTO dto) {
    	ModelAndView mav = new ModelAndView();
    	String hashed = hash.getHash(dto.getUser_pw());
    	dto.setUser_pw(hashed);
      int row = ms.join(dto);
      if (row == 1) {
    	  mav.addObject("msg", "회원가입 완료 로그인 해 주세요");
    	  mav.setViewName("redirect:/member/login");
      }
      else {
    	  mav.addObject("msg", "가입실패");
    	  mav.setViewName("redirect:/member/join");
      }
      return mav;  
    }

    @GetMapping("/nickname_check")
    @ResponseBody
    public int nickname_check(String user_nickname) {
        MemberDTO dto = ms.duplicate_nickname(user_nickname);
      	int row = 0;
      	if (dto != null) row = 1;
      	return row;
    }

    @GetMapping("/email_check")
    @ResponseBody
    public HashMap<String, String> email_check(String user_email) {
    	HashMap < String, String > map = new HashMap < String, String > ();
      	MemberDTO dto = ms.duplicate_email(user_email);
      	String color = "";
        if (dto == null) {
            color = "blue";
        }
        else {
            color = "red";
        }
        map.put("msg", dto == null ? "사용 가능한 이메일입니다." : "이미 사용중인 이메일입니다.");
        map.put("color", color);
        return map;
    }

    @GetMapping("/findEmail")
    @ResponseBody
    public String getEmail(String pnum) {
        return ms.getEmail(pnum);
    }
    
    @GetMapping("/changePw/{newPass}/{user_email}/")
    @ResponseBody
    public int changePw(@PathVariable String newPass, @PathVariable String user_email) {
       return ms.changePw(newPass,user_email);
    }
    
    
    @ExceptionHandler(NullPointerException.class)	// PK나 UK가 중복되어 발생하는 예외
	public ModelAndView duplicateJoin(NullPointerException e) {
		ModelAndView mav = new ModelAndView("/member/login");
		mav.addObject("msg", "아이디와 비밀번호를 확인해 주세요");
		return mav;
	}
}


