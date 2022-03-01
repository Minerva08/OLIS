package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class NoticeService {
	
	@Autowired private NoticeDAO dao;
	
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
	
	
//	public String getText(String path) throws IOException {
//		String text  ="";
//		File f = new File(path);
//		if(f.exists()==false) {
//			System.out.println("파일이 없습니다");
//		}
//		Scanner sc =new Scanner(f);
//		while(sc.hasNextLine()) {
//			text += sc.nextLine() + "\n";
//		}
//		return text;
//	}

	public NoticeDTO getOne(int idx) {
		
		return dao.getnoticeOne(idx);
	}

	public int getCount() {
		return dao.count();
	}

	public List<NoticeDTO> mainList(int offset) {
		// TODO Auto-generated method stub
		return dao.getnoticeList(offset);
	}

	public int insert(NoticeDTO dto) throws Exception {
		File dest1 = null;
		if (dto.getUpload() != null) {
			MultipartFile file = dto.getUpload();
			dest1 = new File(file.getOriginalFilename());
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
		chSftp.cd("/var/www/html/notice");
		chSftp.put(fis, dest1.getName());
		
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/notice/" + dto.getUpload().getOriginalFilename();

		dto.setNotice_content(uploadFilePath);

		return dao.insertNotice(dto);
	}

	public String getContent(String notice_content) throws Exception {
		URL url = new URL(notice_content); 
		
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		
		System.out.println(conn.getResponseCode());
		String text  ="";
		Scanner sc = null;

		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			while(sc.hasNext()) {
				text += sc.nextLine()+"\n";
			}
			sc.close();
			conn.disconnect();
			return text;
		}
		
		return null;
	}

}
