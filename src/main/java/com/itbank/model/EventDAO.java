package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface EventDAO {

	
	//List<EventDTO> getEventList(EventDTO eventpage);

	
	List<EventDTO> searchEventList(PagingDTO eventpaging);

	@Select("select * from event where event_idx = #{event_idx}")
	EventDTO getEventdetail(int event_idx);

	@Select("select count(*) from event")
	int countEvent();



	List<EventDTO> eventList(PagingDTO eventpageing);


	List<EventDTO> EventIngList(PagingDTO eventpageing);


	List<EventDTO> EventEndList(PagingDTO eventpageing);

	
	int countEndEvent();
	int countIngEvent();

	@Select("select count(*) count from event where event_title like '%%${search_event}%%'")
	int searchEventcount(String search_event);

	int insertEvent(EventDTO dto);



}
