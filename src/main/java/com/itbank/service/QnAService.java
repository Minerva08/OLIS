package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.QnADAO;
import com.itbank.model.QnADTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class QnAService {
	@Autowired QnADAO dao;
	
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
	

	public ArrayList<QnADTO> mainList(int offset) {
		
		return dao.getAllList(offset);
	}

	public int count() {
		return dao.getAllListCount();
	}

	public List<QnADTO> FilterList(String qna_category) {
		return dao.getFilterList(qna_category);
	}

	public int Filtercount(String qna_category) {
		return dao.getFilterCount(qna_category);
	}
	
	public List<QnADTO> policyList(int offset) {
		return dao.list_p(offset);
	}

	public int policyCount() {
		return dao.count_p();
	}

	public List<QnADTO> sameList(int offset) {
		return dao.list_s(offset);
	}

	public int sameCount() {
		return dao.count_s();
	}

	public List<QnADTO> sellList(int offset) {
		return dao.list_sell(offset);
	}

	public int sellCount() {
		return dao.count_sell();
	}

	public List<QnADTO> buyList(int offset) {
		return dao.list_b(offset);
	}

	public int buyCount() {
		return dao.count_b();
	}

	public int insert(QnADTO dto) throws Exception {
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
		chSftp.cd("/var/www/html/qna");
		chSftp.put(fis, dest1.getName());
		
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/qna/" + dto.getUpload().getOriginalFilename();

		dto.setQna_content(uploadFilePath);

		return dao.insertqna(dto);
	}

	public String getContent(String qna_content) throws Exception {
		
		URL url = new URL(qna_content); 
		
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		
		
		String text  ="";
		Scanner sc = null;

		System.out.println(conn.getResponseCode());
		
		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			while(sc.hasNext()) {
				text += sc.nextLine()+"\n";
			}
			sc.close();
			conn.disconnect();
			System.out.println(text);
			return text;
		}
		
		return null;
	}


}
