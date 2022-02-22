package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AddressDAO {

	@Insert("insert into address ("
			+ "user_email, "
			+ "address, "
			+ "address_name, "
			+ "address_pnum, "
			+ "default_address) values ("
			+ "#{user_email}, "
			+ "#{address}, "
			+ "#{address_name}, "
			+ "#{address_pnum}, "
			+ "#{default_address})")
	int addinsertAddress(HashMap<String, Object> map);

	@Select("select * from address where user_email=#{user_email}")
	List<AddressDTO> getAddress(String email);

	int updateAddress(HashMap<String, Object> map);

	@Select("select * from address where user_email=#{user_email} and default_address='Y'")
	AddressDTO selectOne(HashMap<String, Object> map);

	@Delete("delete address where address_idx=#{idx}")
	int deleteAddress(int idx);
}
