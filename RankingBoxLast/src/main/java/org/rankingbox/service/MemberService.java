package org.rankingbox.service;

import java.util.Date;

import org.rankingbox.domain.MemberVO;
import org.rankingbox.dto.LoginDTO;

public interface MemberService {

  public MemberVO login(LoginDTO dto) throws Exception;

  public void keepLogin(String param1, String param2, Date param3)throws Exception;
  
  public MemberVO checkLoginBefore(String value); 
  
  public void register(MemberVO vo) throws Exception;
  
  public int idChk(MemberVO vo) throws Exception;
  
  public void modify(MemberVO vo, String newPassword) throws Exception;
  
  public void delete(MemberVO vo) throws Exception;
  
}
