package com.itbank.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.EventDAO;
import com.itbank.model.EventDTO;
import com.itbank.model.PagingDTO;
import com.itbank.model.QnADTO;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class EventService {
	
	@Autowired private EventDAO dao;
	
//	public List<EventDTO> getEventList(EventDTO eventpage) {
//		
//		return dao.getEventList(eventpage);
//	}

	private final String serverIP = "192.168.1.100";
	private int serverPort = 22;
	private final String serverUser = "root";
	private final String serverPass = "1";
	private ChannelSftp chSftp = null;
	

	public int countEvent() {
		
		return dao.countEvent();
	}



	public List<EventDTO> EventIngList(PagingDTO eventpageing) {
		
		return dao.EventIngList(eventpageing);
	}



	public List<EventDTO> EventList(PagingDTO eventpageing) {
		// TODO Auto-generated method stub
		return dao.eventList(eventpageing);
	}



	public List<EventDTO> EventEndList(PagingDTO eventpageing) {
		// TODO Auto-generated method stub
		return dao.EventEndList(eventpageing);
	}



	public int countEndEvent() {
		// TODO Auto-generated method stub
		return dao.countEndEvent();
	}



	public int countIngEvent() {
		// TODO Auto-generated method stub
		return dao.countIngEvent();
	}



	public int CountsearchEvent(String search_event) {
		// TODO Auto-generated method stub
		return dao.searchEventcount(search_event);
	}



	public List<EventDTO> searchEventList(PagingDTO eventpageing) {
		// TODO Auto-generated method stub
		return dao.searchEventList(eventpageing);
	}



	public int insert(EventDTO dto) throws Exception {
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
		chSftp.cd("/var/www/html/event");
		chSftp.put(fis, dest1.getName());
		
		System.out.println("sftp> transfer complete");

		fis.close();
		chSftp.exit();

		String uploadFilePath = "";
		uploadFilePath += "http://";
		uploadFilePath += serverIP;
		uploadFilePath += ":1234"; // 기본 포트는 80이며 작성필요없으나, 서비스가 중복된다면 별도로 지정
		uploadFilePath += "/event/" + dto.getUpload().getOriginalFilename();

		dto.setEvent_img(uploadFilePath);

		return dao.insertEvent(dto);
	}



	


}
