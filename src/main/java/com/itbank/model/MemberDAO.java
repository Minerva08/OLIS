package com.itbank.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {

	@Select("select * from member where user_email = #{user_email} and user_pw =#{user_pw} and member_out='N'")
	MemberDTO isMember(MemberDTO dto);

	int joinMember(MemberDTO dto);

	@Select("select * from member where user_nickname = #{user_nickname}")
	MemberDTO isNickName(String user_nickname);

	@Select("select * from member where user_pnum =#{pnum}")
	String getEmail(String pnum);
	
	@Select("select * from member where user_email=#{user_email}")
	MemberDTO isEmail(String user_email);

	int updateInfo(MemberDTO dto);

	@Update("update member set user_pw=#{newPass} where user_email=#{user_email}")
	int changePw(HashMap<String,Object> map);

	@Update("update member set POINT=#{point} where user_email=#{user_email}")
	int updatePoint(MemberDTO login);

	@Update("update member set user_profile_img=default where user_email=#{user_email}")
	int infoimgDelete(MemberDTO login);

	MemberDTO update_session(String user_email);
	

}
