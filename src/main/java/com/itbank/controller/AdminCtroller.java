package com.itbank.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.EventDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.NoticeDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.QnADTO;
import com.itbank.model.TradeDTO;
import com.itbank.service.EventService;
import com.itbank.service.MemberService;
import com.itbank.service.NoticeService;
import com.itbank.service.ProductService;
import com.itbank.service.QnAService;
import com.itbank.service.TradeService;

@Controller
public class AdminCtroller {
	@Autowired private ProductService ps;
	@Autowired private NoticeService ns;
	@Autowired private QnAService qs;
	@Autowired private TradeService ts;
	@Autowired private MemberService ms;
	@Autowired private EventService es;
	
	@GetMapping("/admin/join_admin")
	public void join_admin() {};
	@PostMapping("/admin/join_admin")
	public ModelAndView add_admin(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = ms.insert_admin(dto);
		if(row==1) {
			mav.setViewName("member/login");
		}
		else {
			
		}
		return mav;
	}
	
	
	@GetMapping("/admin/insertProduct")
	public void insert_product() {};
	@PostMapping("/admin/insertProduct")
	public ModelAndView insert_P(ProductDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/insertProduct");
		int row = ps.insert(dto);
		mav.addObject("num", dto.getProduct_model_num());
		mav.addObject("msg", "상픔 등록 완료 상품 세부사항 입력");
		return mav;
	}
	
	@GetMapping("/admin/insertNotice")
	public void insert_Notice() {};
	@PostMapping("/admin/insertNotice")
	public ModelAndView  insert_N(NoticeDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/insertNotice");
		int row = ns.insert(dto);
		mav.addObject("msg", "공지사항 등록 완료");
		return mav;
	};
	
	@GetMapping("/admin/insertQnA")
	public void insert_qna() {};
	@PostMapping("/admin/insertQnA")
	public ModelAndView  insert_QNA(QnADTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/insertQnA");
		int row = qs.insert(dto);
		mav.addObject("msg", "qna 등록 완료");
		return mav;
	};
	
	@GetMapping("/admin/insertEvent")
	public void insert_Event() {};
	@PostMapping("/admin/insertEvent")
	public ModelAndView  insert_E(EventDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/insertEvent");
		int row = es.insert(dto);
		mav.addObject("msg", "이벤트 등록 완료");
		return mav;
	};
	
	@GetMapping("/admin/trade")
	 public ModelAndView admintradeList(String order, String trade_search,String page,String category) {
			if(page == null) {
				page = "1";
			}
	      ModelAndView mav = new ModelAndView();
	      HashMap<String, Object> map = new HashMap<String, Object>();
			if(order != null && order != "") {
				map.put("order", order);
			}
			else {
				map.put("order", "trade_idx");
			}
			if(trade_search != null && trade_search != "") {
				map.put("search", trade_search);
			}
			if(category != null && category != "") {
				map.put("category", category);
			}
			map.put("offset", page);
		  int count = ts.getCount(map);
	      List<TradeDTO> list = ts.getList(map);
	      mav.addObject("list", list);
	      mav.addObject("count", count);
	      return mav;
	   }

}
