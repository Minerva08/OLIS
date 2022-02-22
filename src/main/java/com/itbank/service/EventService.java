package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.EventDAO;
import com.itbank.model.EventDTO;
import com.itbank.model.PagingDTO;

@Service
public class EventService {
	
	@Autowired private EventDAO dao;
	
//	public List<EventDTO> getEventList(EventDTO eventpage) {
//		
//		return dao.getEventList(eventpage);
//	}



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



	


}
