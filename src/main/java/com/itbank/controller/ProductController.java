package com.itbank.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.AddressDTO;
import com.itbank.model.ItemDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.WishListDTO;
import com.itbank.service.AddressService;
import com.itbank.service.ItemService;
import com.itbank.service.MemberService;
import com.itbank.service.OrderListService;
import com.itbank.service.ProductService;
import com.itbank.service.ReceiptService;
import com.itbank.service.ShoppingService;
import com.itbank.service.WishListService;

@Controller
public class ProductController {
	
	@Autowired private ProductService ps;
	@Autowired private AddressService as;
	@Autowired private ItemService is;
	@Autowired private WishListService ws;
	@Autowired private OrderListService os;
	@Autowired private ReceiptService rs;
	@Autowired private MemberService ms;
	@Autowired private ShoppingService ss;
	
	@GetMapping("/product/productList")
	public ModelAndView productList(String search, String category) {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> brandList = ps.brandList();
		if(search == null) {
			mav.addObject("search", "");
		}
		else {
			mav.addObject("search", search);
		}
		if(category == null) {
			mav.addObject("category", "");
		}
		else {
			mav.addObject("category", category);
			mav.addObject("categoryValue", category.split("=")[1]);
		}
		mav.addObject("brandList", brandList);
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/searchList")
	public List<ProductDTO> productListSearch(String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		return ps.selectList(map);
	}
	
	@GetMapping("/getProductList")
	@ResponseBody
	public List<ProductDTO> getProductList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", "product_wish_count");
		map.put("sort", "desc");
		return ps.selectList(map);
	}
	
	@GetMapping("/product/product_detail")
	public ModelAndView product_detail(@RequestParam String modelnum, HttpSession session ) throws IOException {
		ModelAndView mav = new ModelAndView();

		String url = "http://192.168.1.100:1234/policy/";
		String[] arr = new String[3];
		arr[0] = url+"배송기간안내.txt";
		arr[1] = url+"검수기준.txt";
		arr[2] = url+"구매환불규정.txt";
	

		DecimalFormat fm = new DecimalFormat("###,###");
		
		ProductDTO dto = ps.selectOne(modelnum);
		
		int price = dto.getProduct_price();
		
		List<ItemDTO> item = is.selectItem(modelnum);
		List<String> txts = ps.getTxt(arr);
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		HashMap<String, Object> proMap = new HashMap<String, Object>();
		proMap.put("order", "product_wish_count");
		proMap.put("sort", "desc");
		
		List<ProductDTO> list = ps.selectList(proMap);
		if (login != null) {
			String email = login.getUser_email();
			List<AddressDTO> address = as.getAddress(email);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("wish_model_num", modelnum);
			map.put("wish_user_nickname", login.getUser_nickname());
			List<WishListDTO> wish = ws.getWishList(map);
			String size = "";
			for (int i = 0; i < wish.size(); i++) {
				size += wish.get(i).getWish_size();
				if (i+1 < wish.size()) size += ",";
			}
			mav.addObject("size", size);
			mav.addObject("wish", wish);
			mav.addObject("address", address);
		}
		mav.addObject("new_price", fm.format(price));
		mav.addObject("txts", txts);
		mav.addObject("dto", dto);
		mav.addObject("item", item);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/wishIteminsert")
	@ResponseBody
	public int wishIteminsert(@RequestBody HashMap<String, Object> map) {
		int row = 0;
		row = ws.wishItemInsert(map);
		return row;
	}
	
	@DeleteMapping("/wishItemdelete")
	@ResponseBody
	public int wishItemdelete(String wish_model_num, String wish_size) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("wish_model_num", wish_model_num);
		map.put("wish_size", wish_size);
		int row = 0;
		row = ws.wishItemdelete(map);
		return row;
	}
	
	@PostMapping("/orderReceiptInsert")
	@ResponseBody
	public int orderReceiptInsert(@RequestBody HashMap<String, Object> map, HttpSession session) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		int row1 = 0;
		int row2 = 0;
		int row3 = 0;
		int row4 = 0;
		if (!map.get("point").equals("0")) {
			login.setPoint(login.getPoint() - Integer.parseInt((String)map.get("point")));
			row3 = ms.updatePoint(login);
		}
		HashMap<String, Object> ordto = new HashMap<String, Object>();
		ordto.put("order_price", map.get("order_price"));
		ordto.put("product_model_num", map.get("product_model_num"));
		ordto.put("order_color", map.get("order_color"));
		ordto.put("order_size", map.get("order_size"));
		ordto.put("order_product_img", map.get("order_product_img"));
		ordto.put("order_address", map.get("address"));;
		String uuid = UUID.randomUUID().toString().replace("-", "").substring(0,9);
		ordto.put("order_ordernum",uuid);
		ordto.put("order_nickname", map.get("user_nickname"));
		
		HashMap<String, Object> redto = new HashMap<String, Object>();
		redto.put("user_nickname", map.get("user_nickname"));
		redto.put("receipt_delibery", map.get("receipt_delibery"));
		redto.put("receipt_totalprice", map.get("receipt_totalprice"));
		redto.put("receipt_ordernum", uuid);
		redto.put("receipt_address", map.get("address"));
		redto.put("receipt_img", map.get("receipt_img"));
		
		row2 = rs.receiptInsert(redto);
		row1 = os.orderInsert(ordto);
		
		if (!map.get("idx").equals("0")) {
			int idx = Integer.parseInt((String)map.get("idx"));
			row4 = ss.shoppingKeepDelete(idx);	
		}
		return row2;
	}
	
	
	
	
}

