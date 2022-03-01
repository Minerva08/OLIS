package com.itbank.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.AddressDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.OrderListDTO;
import com.itbank.model.ReceiptDTO;
import com.itbank.model.ShoppingDTO;
import com.itbank.model.TradeDTO;
import com.itbank.model.WishListDTO;
import com.itbank.service.AddressService;
import com.itbank.service.MemberService;
import com.itbank.service.OrderListService;
import com.itbank.service.ReceiptService;
import com.itbank.service.ShoppingService;
import com.itbank.service.TradeService;
import com.itbank.service.WishListService;

@Controller
public class MypageController {
	
	@Autowired private AddressService as;
	@Autowired private MemberService ms;
	@Autowired private TradeService ts;
	@Autowired private WishListService ws;
	@Autowired private OrderListService ol;
	@Autowired private ReceiptService rs;
	@Autowired private ShoppingService ss;
	
	@RequestMapping("/myPage/home_myPage")
	public ModelAndView myPage(HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		OrderListDTO oldto = new OrderListDTO();
		oldto.setOrder_nickname(login.getUser_nickname());
		
		ReceiptDTO redto = new ReceiptDTO();
		redto.setUser_nickname(login.getUser_nickname());
		
		List<OrderListDTO> ollist = ol.getOrderList(oldto);
		List<ReceiptDTO> relist = rs.getReceipt(redto);	
		
		ObjectMapper om = new ObjectMapper();
		JSONArray jr1 = new JSONArray();
		JSONArray jr2 = new JSONArray();
		
		for (OrderListDTO or : ollist) {
			jr1.put(om.writeValueAsString(or));
		}
		for (ReceiptDTO re : relist) {
			jr2.put(om.writeValueAsString(re));
		}
		mav.addObject("orjson", jr1);
		mav.addObject("rejson", jr2);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("trade_writer", login.getUser_nickname());
		map.put("order", "trade_idx");
		List<TradeDTO> list = ts.getList(map);
		JSONArray jr = new JSONArray();
		
		for (TradeDTO dto : list) {
			jr.put(om.writeValueAsString(dto));
		}
		mav.addObject("salejson", jr);
		return mav;
	}
	
	@GetMapping("/myPage/buyList")
	public ModelAndView buyList(HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login"); 
		if (login != null) {
			OrderListDTO oldto = new OrderListDTO();
			oldto.setOrder_nickname(login.getUser_nickname());
			
			ReceiptDTO redto = new ReceiptDTO();
			redto.setUser_nickname(login.getUser_nickname());
			
			List<OrderListDTO> ollist = ol.getOrderList(oldto);
			List<ReceiptDTO> relist = rs.getReceipt(redto);	
			
			ObjectMapper om = new ObjectMapper();//string->object OR object -> string
			
			JSONArray jr1 = new JSONArray();
			JSONArray jr2 = new JSONArray();
			
			for (OrderListDTO or : ollist) {
			
				jr1.put(om.writeValueAsString(or));
			}
			for (ReceiptDTO re : relist) {
				
				jr2.put(om.writeValueAsString(re));
			}
			mav.addObject("orjson", jr1);
			mav.addObject("rejson", jr2);
		}
		return mav;
	}
	
	@GetMapping("/myPage/saleList")
	public ModelAndView saleList(HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView("/myPage/saleList");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if (login != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("trade_writer", login.getUser_nickname());
			map.put("order", "trade_idx");
			
			List<TradeDTO> list = ts.getList(map);
			ObjectMapper om = new ObjectMapper();
			
			JSONArray jr = new JSONArray();
			for (TradeDTO dto : list) {
				jr.put(om.writeValueAsString(dto));
			}
			mav.addObject("salejson", jr);
		}
		return mav;
	}
	
	@GetMapping("/myPage/wishList")
	public ModelAndView wishList(HttpSession session, int page) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		int count = ws.getCount(dto.getUser_nickname());
		System.out.println("count : " + count);
		int offset = page;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", offset * 10);
		map.put("wish_user_nickname", dto.getUser_nickname());
		List<WishListDTO> list = ws.getWishList(map);
		mav.addObject("page", page);
		mav.addObject("wishlist", list);
		mav.addObject("count", count);
		return mav;
	}
	@GetMapping("/myPage/shopping")
	public ModelAndView account(HttpSession session, int page) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		int count = ss.getCount(login.getUser_nickname());
		System.out.println("count : " + count);
		int offset = page;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", offset * 10);
		map.put("shopping_user_nickname", login.getUser_nickname());
		List<ShoppingDTO> list = ss.getListshopping(map);
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("page", page);
		return mav;
	}
	@GetMapping("/deleteWishList")
	public ModelAndView deleteWishList(int idx, int page) {
		ModelAndView mav = new ModelAndView("redirect:/myPage/wishList?page=" + page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("wish_idx", idx);
		int row = ws.wishItemdelete(map);
		if (row == 0) {
			mav.addObject("msg", "삭제 실패 했습니다");
		}
		return mav;
	}
	
	@GetMapping("/myPage/point")
	public String point() {
		return "/myPage/point";
	}
	
	@GetMapping("/myPage/info")
	public String info(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		MemberDTO dto = new MemberDTO();
		dto.setUser_email(login.getUser_email());
		dto.setUser_pw(login.getUser_pw());
		MemberDTO info = ms.isMember(dto);
		session.setAttribute("login", info);
		return "/myPage/info";
	}
	
	@PostMapping("/myPage/addinsertAddress")
	@ResponseBody
	public int addinsertAddress(@RequestBody HashMap<String, Object> map) {
	
		System.out.println(map.get("user_email"));
		System.out.println(map.get("address_name"));
		System.out.println(map.get("address"));
		System.out.println(map.get("default_address"));
		System.out.println(map.get("address_pnum"));
		
		
		int row = 0;
		if (map.get("default_address").equals("Y")) {
			AddressDTO dto = as.selectOne(map);
			row++;
			if (dto != null) {
				as.updateAddress(map);
			}
		}
		row += as.addinsertAddress(map);
		System.out.println("row"+row);
		return row;
	}
	
	@PutMapping("/myPage/updateAddress")
	@ResponseBody
	public int updateAddress(@RequestBody HashMap<String, Object> map) {
		int row = 0;
		if (map.get("default_address").equals("Y")) {
			map.remove("modify");
			as.updateAddress(map);
		}
		map.put("modify", "notnull");
		return row = as.updateAddress(map);
	}
	
	@GetMapping("/myPage/address")
	public ModelAndView address(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String email = login.getUser_email();
		List<AddressDTO> list = as.getAddress(email);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getDefault_address().equals("Y")) {
				mav.addObject("addressDefault", list.get(i));
				list.remove(i);
			}
		}
		mav.addObject("address", list);
		return mav;
	}
	
	@DeleteMapping("/deleteAddress")
	@ResponseBody
	public int deleteAddress(int idx) {
		int row = 0;
		row = as.deleteAddress(idx);
		return row;
	}

	@PostMapping("/updateInfo")
	public ModelAndView updateInfo(MemberDTO dto,HttpSession session) throws Exception {
		System.out.println("1 : " + dto.getUser_profile_img());
		System.out.println("2 : " + dto.getUpload());
		
		ModelAndView mav = new ModelAndView("redirect:/myPage/info");
		int row = ms.updateInfo(dto);
		MemberDTO memberinfo = ms.Member(dto.getUser_email());
		if (row == 0) {
			mav.addObject("msg", "수정 실패 했습니다");
		}
		else {
			
			session.setAttribute("login", memberinfo);
			MemberDTO DTO = (MemberDTO)session.getAttribute("login");
			if(DTO.getMember_out().equals("Y")) {
				mav.setViewName("redirect:/");
				session.invalidate();
			}
		}
		
		return mav;
	}
	
	@GetMapping("/salelistSoldUpdate")
	public ModelAndView salelistSoldUpdate(int idx) {
		ModelAndView mav = new ModelAndView("redirect:/myPage/saleList");
		TradeDTO td = new TradeDTO();
		String sdf = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		td.setTrade_idx(idx);
		java.sql.Date sd = java.sql.Date.valueOf(sdf);
		td.setTrade_sold_date(sd);
		int row = ts.salelistSoldUpdate(td);
		if (row == 0) {
			mav.addObject("salemsg", "판매확정 실패 했습니다");
		}
		return mav;
	}
	
	@GetMapping("/orderlistSoldUpdate")
	public ModelAndView orderlistSoldUpdate(String nick, String ordernum, String size, int point, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/myPage/buyList");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		int userpoint = login.getPoint();
		int totalpoint = (int) (userpoint + (1.0/100.0 * point));
		login.setPoint(totalpoint);
		int row2 = ms.updatePoint(login);
		OrderListDTO or = new OrderListDTO();
		or.setOrder_nickname(nick);
		or.setOrder_ordernum(ordernum);
		or.setOrder_size(size);
		int row = ol.orderlistSoldUpdate(or);
		return mav;
	}
	
	@GetMapping("/salelistDelete")
	public String salelistDelete(int idx) {
		int row = 0;
		row = ts.salelistDelete(idx);
		return "redirect:/myPage/saleList";
	}
	
	@GetMapping("/getSaleList")
	@ResponseBody
	public List<TradeDTO> getSaleList(String page, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("order", "trade_idx");
		map.put("trade_writer", login.getUser_nickname());
		return ts.getList(map);
	}
	
	@GetMapping("/getfetchbuy")
	@ResponseBody
	public List<OrderListDTO> getfetchbuy(String page, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("order_nickname", login.getUser_nickname());
		return ol.getOrderList(map);
	}
	
	@GetMapping("/getfetchreceipt")
	@ResponseBody List<ReceiptDTO> getfetchreceipt(String page, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("user_nickname", login.getUser_nickname());
		return rs.getReceiptmore(map);
	}
	
	@PostMapping("/shoppinginsert")
	@ResponseBody
	public int shoppinginsert(@RequestBody HashMap<String, Object> map) {
		int row = 0;
		row = ss.shoppinginsert(map);
		return row;
	}
	
	@GetMapping("/shoppingKeepDelete")
	public String shoppingKeepDelete(int idx, int page) {
		int row = 0;
		row = ss.shoppingKeepDelete(idx);
		return "redirect:/myPage/shopping?page=" + page;
	}
	
	@PostMapping("/TradeSaleUpdate")
	public String TradesaleUpdte(TradeDTO dto, HttpSession session) throws Exception {
		 MemberDTO mbDTO = (MemberDTO) session.getAttribute("login");
	      int row = ts.myPagesaleUpdte(dto, mbDTO);
		return "redirect:/myPage/saleList";
	}
	
	@GetMapping("/infoimgDelete")
	public String infoimgDelete(HttpSession session) {
		int row = 0;
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		row = ms.infoimgDelete(login);
		System.out.println(row);
		return "redirect:/myPage/info";
	}
	
}
