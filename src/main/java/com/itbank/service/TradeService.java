package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.Hash;
import com.itbank.model.MemberDTO;
import com.itbank.model.TradeDAO;
import com.itbank.model.TradeDTO;
import com.itbank.model.TradeReplyDTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class TradeService {
	
	@Autowired private TradeDAO dao;
	
	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;

	public int insert(TradeDTO dto, MemberDTO mbDTO) throws Exception {
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		File dest1 = null;
		File dest2 = null;
		File dest3 = null;

		String price = String.format("%d", dto.getTrade_price());
		price = price.replaceAll(",", "");
		dto.setTrade_price(Integer.parseInt(price));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		if (dto.getUpload() != null) {
			fileName1 = mbDTO.getUser_nickname();
			System.out.println(fileName1);
			fileName1 = fileName1 + today + "_" + dto.getUpload().getOriginalFilename();

			MultipartFile file = dto.getUpload();
			dest1 = new File(fileName1);
			file.transferTo(dest1);
		}
		if (dto.getUpload2().getOriginalFilename() != "") {
			fileName2 = mbDTO.getUser_nickname();
			fileName2 = fileName2 + today + "_" + dto.getUpload2().getOriginalFilename();

			MultipartFile file = dto.getUpload2();
			dest2 = new File(file.getOriginalFilename());
			file.transferTo(dest2);
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			fileName3 = mbDTO.getUser_nickname();
			fileName3 = fileName3 + today + "_" + dto.getUpload3().getOriginalFilename();

			MultipartFile file = dto.getUpload3();
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
		chSftp.cd("/var/www/html/trade");
		chSftp.put(fis, fileName1);
		if (dto.getUpload2().getOriginalFilename() != "") {
			FileInputStream fis2 = new FileInputStream(dest2);
			chSftp.cd("/var/www/html/trade");
			chSftp.put(fis2, fileName2);
			fis2.close();

			String uploadFilePath2 = "";
			uploadFilePath2 += "http://";
			uploadFilePath2 += serverIP;
			uploadFilePath2 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath2 += "/trade/" + fileName2;

			dto.setTrade_img2(uploadFilePath2);
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			FileInputStream fis3 = new FileInputStream(dest3);
			chSftp.cd("/var/www/html/trade");
			chSftp.put(fis3, fileName3);
			fis3.close();

			String uploadFilePath3 = "";
			uploadFilePath3 += "http://";
			uploadFilePath3 += serverIP;
			uploadFilePath3 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath3 += "/trade/" + fileName3;

			dto.setTrade_img3(uploadFilePath3);
		}
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/trade/" + fileName1;

		dto.setTrade_img1(uploadFilePath);

		dto.setTrade_writer(mbDTO.getUser_nickname());
		dto.setTrade_user_profile(mbDTO.getUser_profile_img());
		
		System.out.println("가격 :"+dto.getTrade_price1());
	    String[] arr_p = dto.getTrade_price1().split(",");
	    int Trade_price=0;
	      for(int i=0; i<arr_p.length; i++) {
	    	  System.out.println(arr_p[i]);
	    	  Trade_price += Integer.parseInt(arr_p[i]);
	    	  if(i!= arr_p.length-1) {
	    		  Trade_price*=1000;
	    	  } 
	      }
	      dto.setTrade_price(Trade_price);
		return dao.insert(dto);
	}

	public TradeDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public List<TradeDTO> getList(HashMap<String, Object> map) {
		if(map.get("offset") != null) {
			String offset = (String)map.get("offset");
			int perPage = 10;
			int resultPage = (Integer.parseInt(offset) - 1) * perPage;
			String page = String.valueOf(resultPage);
			map.put("page", page);
		}
		return dao.getList(map);
	}

	public int insertReply(HashMap<String, String> dto) {
		return dao.insertReply(dto);
	}

	public List<TradeReplyDTO> selectRep(int trade_idx) {
		return dao.selectRep(trade_idx);
	}

	public int modifyReply(HashMap<String, Object> map) {
		return dao.modifyReply(map);
	}

	public int deleteReply(int tradeReply_idx) {
		return dao.deleteReply(tradeReply_idx);
	}

	public int salelistSoldUpdate(TradeDTO td) {
		return dao.salelistSoldUpdate(td);
	}

	public int getCount(HashMap<String, Object> map) {
		List<TradeDTO> list = dao.getList(map);
		int count = list.size();
		int resultCount = count / 10;
		resultCount += (count % 10 == 0) ? 0 : 1;
		return resultCount;
	}

	public int salelistDelete(int idx) {
		return dao.salelistDelete(idx);
	}

	public int myPagesaleUpdte(TradeDTO dto, MemberDTO mbDTO) throws Exception {
		if (dto.getUpload() == null || dto.getUpload().getOriginalFilename() == "") {
			System.out.println("널입니다");
			dto.setTrade_writer(mbDTO.getUser_nickname());
			dto.setTrade_user_profile(mbDTO.getUser_profile_img());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			java.sql.Date sd = java.sql.Date.valueOf(today);
			dto.setTrade_upload_date(sd);
			return dao.myPagesaleUpdte(dto);
		}
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		File dest1 = null;
		File dest2 = null;
		File dest3 = null;


		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		if (dto.getUpload() != null) {
			fileName1 = mbDTO.getUser_nickname();
			fileName1 = fileName1 + today + "_" + dto.getUpload().getOriginalFilename();

			MultipartFile file = dto.getUpload();
			dest1 = new File(fileName1);
			file.transferTo(dest1);
		}
		if (dto.getUpload2().getOriginalFilename() != "") {
			fileName2 = mbDTO.getUser_nickname();
			fileName2 = fileName2 + today + "_" + dto.getUpload2().getOriginalFilename();

			MultipartFile file = dto.getUpload2();
			dest2 = new File(file.getOriginalFilename());
			file.transferTo(dest2);
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			fileName3 = mbDTO.getUser_nickname();
			fileName3 = fileName3 + today + "_" + dto.getUpload3().getOriginalFilename();

			MultipartFile file = dto.getUpload3();
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
		chSftp.cd("/var/www/html");
		chSftp.put(fis, dest1.getName());
		if (dto.getUpload2().getOriginalFilename() != "") {
			FileInputStream fis2 = new FileInputStream(dest2);
			chSftp.cd("/var/www/html/trade");
			chSftp.put(fis, dest2.getName());
			fis2.close();

			String uploadFilePath2 = "";
			uploadFilePath2 += "http://";
			uploadFilePath2 += serverIP;
			uploadFilePath2 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath2 += "/trade/" + fileName2;

			dto.setTrade_img2(uploadFilePath2);
		}
		if (dto.getUpload3().getOriginalFilename() != "") {
			FileInputStream fis3 = new FileInputStream(dest3);
			chSftp.cd("/var/www/html/trade/");
			chSftp.put(fis, dest3.getName());
			fis3.close();

			String uploadFilePath3 = "";
			uploadFilePath3 += "http://";
			uploadFilePath3 += serverIP;
			uploadFilePath3 += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
			uploadFilePath3 += "/trade/" + fileName3;

			dto.setTrade_img3(uploadFilePath3);
		}
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/trade/" + fileName1;

		dto.setTrade_img1(uploadFilePath);
		dto.setTrade_writer(mbDTO.getUser_nickname());
		dto.setTrade_user_profile(mbDTO.getUser_profile_img());
		return dao.myPagesaleUpdte(dto);
	}
	
    public int likeCount(HashMap<String, Object> map) {
    	return dao.likeCount(map);
    }

	public int delete(int trade_idx) {
		// TODO Auto-generated method stub
		return dao.trade_delete(trade_idx);
	}



	
}
