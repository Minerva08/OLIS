package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDAO;
import com.itbank.model.ProductDTO;
import com.itbank.model.TradeDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class ProductService {
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
	
	@Autowired private ProductDAO dao;
	public List<ProductDTO> selectList(HashMap<String, Object> map) {
		return dao.getList(map);
	}
	
	public ProductDTO selectOne(String param) {
		return dao.selectOne(param);
	}
	public List<String> getTxt(String[] arr) throws IOException {

		List<String> txts = new ArrayList<String>();
		
		for(int i=0; i<arr.length; i++) {
			System.out.println(arr[i]);
			URL url = new URL(arr[i]);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			
			
			String contents = "";
			Scanner sc = null;
			
			if(conn.getResponseCode() == 200) {
				sc = new Scanner(conn.getInputStream());
				while(sc.hasNext()) {
					contents += sc.nextLine()+"\n";
				}
				System.out.println(contents);
				txts.add(contents);
				sc.close();
				conn.disconnect();
			}
			
			
		}
		
		return txts;
	
	}

	public int insert(ProductDTO dto) throws Exception {
		File dest1 = null;
		File dest2 = null;
		File dest3 = null;
		if (dto.getUpload().getOriginalFilename()!= null) {
			System.out.println(dto.getUpload());
			MultipartFile file = dto.getUpload();
			System.out.println("file.getOriginalFilename() : "+file.getOriginalFilename());
			dest1 = new File(file.getOriginalFilename());
			file.transferTo(dest1);
		}
		if (dto.getUpload2().getOriginalFilename() != "") {
			System.out.println(dto.getUpload());
			MultipartFile file = dto.getUpload2();
			System.out.println("file.getOriginalFilename() : "+file.getOriginalFilename());
			dest2 = new File(file.getOriginalFilename());
			file.transferTo(dest2);
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			System.out.println(dto.getUpload());
			MultipartFile file = dto.getUpload3();
			System.out.println("file.getOriginalFilename() : "+file.getOriginalFilename());
			dest3 = new File(file.getOriginalFilename());
			file.transferTo(dest3);
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
		chSftp.cd("/var/www/html/product");
		chSftp.put(fis, dest1.getName());
		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/product/" + dto.getUpload().getOriginalFilename();
		
		dto.setProduct_img1(uploadFilePath);
		System.out.println(dto.getProduct_img1());
		
		if (dto.getUpload2().getOriginalFilename() != "") {
			FileInputStream fis2 = new FileInputStream(dest2);
			chSftp.cd("/var/www/html/product");
			chSftp.put(fis2, dest2.getName());
			fis2.close();

			String uploadFilePath2 = "";
			uploadFilePath2 += "http://";
			uploadFilePath2 += serverIP;
			uploadFilePath2 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath2 += "/product/" + dto.getUpload2().getOriginalFilename();

			dto.setProduct_img2(uploadFilePath2);
			System.out.println(dto.getProduct_img2());
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			FileInputStream fis3 = new FileInputStream(dest3);
			chSftp.cd("/var/www/html/product");
			chSftp.put(fis3, dest3.getName());
			fis3.close();

			String uploadFilePath3 = "";
			uploadFilePath3 += "http://";
			uploadFilePath3 += serverIP;
			uploadFilePath3 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath3 += "/product/" + dto.getUpload3().getOriginalFilename();

			dto.setProduct_img3(uploadFilePath3);
			System.out.println(dto.getProduct_img3());
		}
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();


		return dao.insert(dto);
	}

	public List<ProductDTO> brandList() {
		return dao.brandList();
	}

	

	
}
