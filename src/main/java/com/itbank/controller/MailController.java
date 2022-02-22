package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.mail.Hash;
import com.itbank.mail.MailService;

@RestController
public class MailController {
	
	@Autowired private MailService mailService;
	@Autowired private Hash hash;
	
	@GetMapping("/mailto/{user_email}/")
	public HashMap<String, String> mailto(@PathVariable String user_email, HttpSession session) throws IOException{
		System.out.println("인증번호를 받을 이메일 주소 : " + user_email);
		String authNumber = mailService.getAuthNumber();
		String hashNumber = hash.getHash(authNumber);
		//세션은 클라이언트 1명당 1개의 객체가 생성. 세션에 저장해두면 다른 클라이언트와 섞일 일이 없다.
		session.setAttribute("hashNumber", hashNumber);
		String account = null;
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/account.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			System.err.println("메일 전송에 필요한 계정 정보가 없습니다.");
			return null;
		}
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		String result = mailService.sendMail(user_email, authNumber, account);
		HashMap<String, String> ret = new HashMap<String, String>();
		if(result.equals(authNumber)) {
			ret.put("status", "OK");
			ret.put("message","인증번호가 발송되었습니다.");
		}
		else {
			ret.put("status", "FAIL");
			ret.put("message", "인증번호 발송에 실패했습니다");
		}
		return ret;
	}
	
	@GetMapping("/getAuthResult/{userNumber}")
	public HashMap<String, String> getAuthResult(@PathVariable String userNumber, HttpSession session) {
		String sessionHash = (String) session.getAttribute("hashNumber");
		String userHash = hash.getHash(userNumber);
		boolean flag = userHash.equals(sessionHash);
		HashMap<String, String> ret = new HashMap<String, String>();
		ret.put("status", flag ? "OK" : "Fail");
		ret.put("message", flag ? "인증이 완료되었습니다" : "인증번호를 다시 확인해주세요");
		
		return ret;
	}
	
	
}
