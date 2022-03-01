package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.model.TradeDTO;
import com.itbank.model.TradeReplyDTO;
import com.itbank.service.TradeService;

@Controller
public class TradeController {

	@Autowired private TradeService ts;
	
	@GetMapping("/trade/tradeList")
	   public ModelAndView tradeList(String order, String trade_search,String page,String category) {
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
	   @GetMapping("/trade")
	   public ModelAndView trade_delete(@RequestParam int trade_idx) {
		   ModelAndView mav = new ModelAndView();
		   System.out.println(trade_idx);
		   int row = ts.delete(trade_idx);
		   if(row==1) {
			   mav.setViewName("redirect:/trade/tradeList");
		   } 
		   return mav;
	   }
	   @PostMapping("/trade/trade_insert")
	   public ModelAndView trade_detail(TradeDTO dto, HttpSession session) throws Exception {
	      ModelAndView mav = new ModelAndView("redirect:/trade/tradeList");
	      MemberDTO mbDTO = (MemberDTO) session.getAttribute("login");
	      
	      int row = ts.insert(dto, mbDTO);
	      if(row == 1) {
	         System.out.println("추가 성공");
	      }
	      else {
	         System.out.println("추가 실패");
	      }
	      return mav;
	   }

	   @GetMapping("/trade/trade_detail")
	   public ModelAndView trade_detail(@RequestParam int idx) {
	      ModelAndView mav = new ModelAndView();
	      TradeDTO dto = ts.selectOne(idx);
	      mav.addObject("dto", dto);
	      return mav;
	   }
	   
	   @PostMapping("/trade/tradeReply")
	   @ResponseBody
	   public int tradeReply(@RequestBody HashMap<String,String> dto) {
		   System.out.println(dto);
		  
		   int row = ts.insertReply(dto);
		   return row;
	   }
	   
	   @GetMapping("/trade/viewReply")
	   @ResponseBody
	   public List<TradeReplyDTO> viewReply(int trade_idx){
		   List<TradeReplyDTO> rep = ts.selectRep(trade_idx);
		   return rep;
	   }
	 
	   
	   @GetMapping("/trade/deleteReply/{tradeReply_idx}")
	   @ResponseBody
	   public int deleteReply(@PathVariable int tradeReply_idx) {
		   int row = ts.deleteReply(tradeReply_idx);
		   return row;
	   }
	   
	   
	   @GetMapping("/trade/modifyComm")
	      @ResponseBody
	      public int modifyReply(String tradeReply_comment, int tradeReply_idx) {
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("tradeReply_comment", tradeReply_comment);
	         map.put("tradeReply_idx",tradeReply_idx);
	         int row = ts.modifyReply(map);
	         return row;
	      }
	      
	     @GetMapping("/trade/likeCount")
	     @ResponseBody
	     public int likeCount(int trade_idx,String trade_like_count) {
	        HashMap<String, Object> map = new HashMap<String, Object>();
	        map.put("trade_idx",trade_idx);
	        map.put("trade_like_count", Integer.parseInt(trade_like_count));
	        
	        int row = ts.likeCount(map);
	        return row;
	     }
	   
	   
}
