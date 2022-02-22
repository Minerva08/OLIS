package com.itbank.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.NoticeDTO;
import com.itbank.model.QnADTO;
import com.itbank.service.NoticeService;
import com.itbank.service.QnAService;

@Controller
public class CenterCtroller {
	
	@Autowired private QnAService qs;
	@Autowired private NoticeService ns;

	@GetMapping("/center/QnA")
	public ModelAndView qnaList(@RequestParam int page) throws Exception {
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/QnA");
		int offset = (page - 1) * 7;
		ArrayList<QnADTO> list = qs.mainList(offset);
		int total_contents = qs.count();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;
		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i).getQna_content());
			list.get(i).setQna_content(qs.getContent(list.get(i).getQna_content()));
			System.out.println(list.get(i));
		}
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		return mav;
	}

	@GetMapping("/center/이용정책")
	public ModelAndView qna_policy(@RequestParam int page){
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/이용정책");
		int offset = (page - 1) * 7;
		List<QnADTO> list = qs.policyList(offset);
		int total_contents = qs.policyCount();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;
		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		return mav;
	}

	@GetMapping("/center/공통")
	public ModelAndView qna_same(@RequestParam int page) {
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/공통");
		int offset = (page - 1) * 7;
		List<QnADTO> list = qs.sameList(offset);
		int total_contents = qs.sameCount();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;
		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		return mav;
	}

	@GetMapping("/center/판매")
	public ModelAndView sell_policy(@RequestParam int page){
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/판매");
		int offset = (page - 1) * 7;
		List<QnADTO> list = qs.sellList(offset);
		int total_contents = qs.sellCount();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;
		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		return mav;
	}

	@GetMapping("/center/구매")
	public ModelAndView buy_policy(@RequestParam int page){
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/구매");
		int offset = (page - 1) * 7;
		List<QnADTO> list = qs.buyList(offset);
	
		int total_contents = qs.buyCount();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;

		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		return mav;
	}

	@GetMapping("/QnA_filter/{qna_category}")
	@ResponseBody
	public HashMap<String, Object> qnafilter_buy(@PathVariable String qna_category){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<QnADTO> list = qs.FilterList(qna_category);
		int count = qs.Filtercount(qna_category);
		map.put("list", list);
		map.put("count", count);
		return map;
	}

	@GetMapping("/center/home_notice")
	public ModelAndView noticeList(@RequestParam int page){
		if (page == 0) {
			page = 1;
		}
		ModelAndView mav = new ModelAndView("center/home_notice");
		int offset = (page - 1) * 7;
		List<NoticeDTO> list = ns.mainList(offset);
		
		int total_contents = ns.getCount();// 전체 게시물 수
		int section = (page - 1) / 9;// 페이징 버튼 그룹
		int begin = 1;// 페이징 버튼 시작
		if (section != 0) {
			begin = section * 9 + 1;
		}
		int perpage = 7;// 한페이지당 게시물 개수
		int buttons = 0;
		int end = begin + 8;

		if (total_contents % perpage == 0) {
			buttons = total_contents / perpage;
		} else {
			buttons = (total_contents / perpage) + 1;
		}
		if (end >= buttons) {
			end = buttons;
		}
		boolean pre = section != 0;
		boolean next = buttons != end;
		mav.addObject("list", list);
		mav.addObject("total_contents", total_contents);
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("perpage", perpage);
		mav.addObject("buttons", buttons);
		mav.addObject("pre", pre);
		mav.addObject("next", next);
		
		return mav;
	}

	@GetMapping("/center/notice_detail/{idx}")
	public ModelAndView notice_detail(@PathVariable int idx) throws Exception {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = ns.getOne(idx);
		String content = ns.getContent(dto.getNotice_content());
		dto.setNotice_content(content);
		mav.setViewName("/center/notice_detail");
		mav.addObject("dto", dto);
		return mav;
	}

}
