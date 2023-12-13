package org.rankingbox.mapper;

import java.util.Date;

import org.rankingbox.domain.MemberVO;
import org.rankingbox.dto.LoginDTO;

public interface MemberMapper {
	
	public MemberVO getMemberById(String memId);

	public MemberVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String param1, String param2, Date param3);

	public MemberVO checkUserWithSessionKey(String value);
	
	public void register(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
	
	public void delete(MemberVO vo) throws Exception;
}
