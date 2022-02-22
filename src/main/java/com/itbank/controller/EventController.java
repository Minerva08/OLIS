package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.EventDTO;
import com.itbank.model.PagingDTO;
import com.itbank.service.EventService;
import com.itbank.service.MemberService;

@Controller
public class EventController {

	@Autowired private EventService es;
	
	@GetMapping("/event/eventList")
	public ModelAndView eventList(@RequestParam(value = "nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, EventDTO dto) {
		int total = es.countEvent();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		ModelAndView mav = new ModelAndView("/event/eventList");
		
		PagingDTO eventpageing = new PagingDTO(Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),total,"");
		
		List<EventDTO> eventList = es.EventList(eventpageing);
		
		mav.addObject("eventList", eventList);
		mav.addObject("eventpageing", eventpageing);
		mav.addObject("No",1);
		return mav;
	}
	
	@GetMapping("/event/event_search")
	public ModelAndView event_search(@RequestParam(value = "nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam("search_event")String search_event){
		
		int total = es.CountsearchEvent(search_event);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		ModelAndView mav = new ModelAndView("/event/eventList");
		PagingDTO eventpageing = new PagingDTO(Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),total,search_event);
		List<EventDTO> event_search_list = es.searchEventList(eventpageing);
		
		
		mav.addObject("eventList", event_search_list);
		mav.addObject("eventpageing", eventpageing);
		mav.addObject("No",4);

		return mav;
	}
	
	@GetMapping("/event/event_date")

	public ModelAndView event_ing(@RequestParam(value = "nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, EventDTO dto) {
		int total = es.countIngEvent();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		
		ModelAndView mav = new ModelAndView("/event/eventList");
		
		PagingDTO eventpageing = new PagingDTO(Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),total,"");
		
		List<EventDTO> event_date_list = es.EventIngList(eventpageing);

		mav.addObject("eventList", event_date_list);
		mav.addObject("eventpageing", eventpageing);
		mav.addObject("No",2);

		return mav;
		
	}
	
	@GetMapping("/event/event_theEnd")	
	public ModelAndView event_end(@RequestParam(value = "nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, EventDTO dto) {
		int total = es.countEndEvent();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		
		ModelAndView mav = new ModelAndView("/event/eventList");
	
		PagingDTO eventpageing = new PagingDTO(Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),total,"");
		
		List<EventDTO> event_date_list = es.EventEndList(eventpageing);
		
		mav.addObject("eventList", event_date_list);
		mav.addObject("eventpageing", eventpageing);
		mav.addObject("No",3);
		
		return mav;
		
	}

}

