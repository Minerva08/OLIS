package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.mail.Hash;
import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	@Autowired private Hash hash;
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
	
	public MemberDTO isMember(MemberDTO dto) {
		return dao.isMember(dto);
	}

	public int join(MemberDTO dto) {
		return dao.joinMember(dto);
	}
	
	public MemberDTO duplicate_nickname(String user_nickname) {
		return dao.isNickName(user_nickname);
	}

	public String getEmail(String pnum) {
		return dao.getEmail(pnum);
	}

	public MemberDTO duplicate_email(String user_email) {
		return dao.isEmail(user_email);
	}

	public MemberDTO modify_info(String email) {
		return dao.isEmail(email);
	}

	public int updateInfo(MemberDTO dto) throws Exception {
		if(dto.getUpload()!=null) {
		
			String fileName1 = "";
			File dest1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			if (dto.getUpload() != null) {
				fileName1 = dto.getUser_email();
				fileName1 = fileName1 + today + "_" + dto.getUpload().getOriginalFilename();
	
				MultipartFile file = dto.getUpload();
				dest1 = new File(fileName1);
				file.transferTo(dest1);
			}
			// 웹서버에 생성된 임시파일을 파일서버에 전송
			Session sess = null;
			Channel channel = null;
			JSch jsch = new JSch();
	
			sess = jsch.getSession(serverUser, serverIP, serverPort);
			sess.setPassword(serverPass);
			sess.setConfig("StrictHostKeyChecking", "no");
			sess.connect();
			System.out.println("sftp > connected");
			channel = sess.openChannel("sftp");
			channel.connect();
	
			chSftp = (ChannelSftp) channel;
	
			FileInputStream fis = new FileInputStream(dest1);
			chSftp.cd("/var/www/html/profile");
			chSftp.put(fis, dest1.getName());
			System.out.println("sftp> transfer complete");
	
			fis.close();
			chSftp.exit();
	
			String uploadFilePath = "";
			uploadFilePath += "http://";
			uploadFilePath += serverIP;
			uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath += "/profile/" + fileName1;
	
			dto.setUser_profile_img(uploadFilePath);
			System.out.println("1212 : " + dto.getUser_profile_img());
//			return dao.updateInfo(dto);
		}
		if(dto.getUser_pw()!=null) {
			String hashed = hash.getHash(dto.getUser_pw());
			dto.setUser_pw(hashed);
//			return dao.updateInfo(dto);
		}
//		if(dto.getUser_pnum()!=null) {
//			return dao.updateInfo(dto);
//		}
//		if(dto.getMember_out()!=null) {
//			return dao.updateInfo(dto);
//		}
		return dao.updateInfo(dto);
		
	}


	public int changePw(HashMap<String, Object> map) {
		String hashed = hash.getHash(map.get("newPass").toString());
		map.put("newPass",hashed);
	      return dao.changePw(map);
	   }

	public int updatePoint(MemberDTO login) {
		return dao.updatePoint(login);
	}

	public int infoimgDelete(MemberDTO login) {
		return dao.infoimgDelete(login);
	}

	public MemberDTO Member(String user_email) {
		// TODO Auto-generated method stub
		return dao.update_session(user_email);
	}

	public int insert_admin(MemberDTO dto) {
		
		return dao.joinMember(dto);
	}
}
