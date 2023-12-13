 package org.rankingbox.service;

import java.util.Date;

import org.rankingbox.domain.MemberVO;
import org.rankingbox.dto.LoginDTO;
import org.rankingbox.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class MemberServiceImpl implements MemberService {


  @Autowired
	private MemberMapper memberMapper;
  
  @Autowired
  @Qualifier("passwordEncoder")
  private PasswordEncoder passwordEncoder;

  @Override
  @Transactional
  public void register(MemberVO vo) throws Exception {
      String rawPassword = vo.getMemPw(); // 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙橘占싫�
      String encodedPassword = passwordEncoder.encode(rawPassword); // 占쏙옙橘占싫� 占쏙옙호화
      vo.setMemPw(encodedPassword); // 占쏙옙호화占쏙옙 占쏙옙橘占싫ｏ옙占� 占쏙옙占쏙옙

      memberMapper.register(vo); // 占쏙옙호화占쏙옙 占쏙옙橘占싫ｏ옙占� 占쏙옙占쏙옙占쏙옙 회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
  }
  
  
  @Override
  public int idChk(MemberVO vo) throws Exception {
	  int result = memberMapper.idChk(vo);
	  return result;
  }
  
  
  @Override
  @Transactional
  public void modify(MemberVO vo, String newPassword) throws Exception {
	   
	        
	        String rawPassword = newPassword;
	        String encodedPassword = passwordEncoder.encode(rawPassword);

	      
	        vo.setMemPw(encodedPassword);
	        memberMapper.modify(vo);
	       
	}

  @Override
  @Transactional
  public void delete(MemberVO vo) throws Exception {
		/*
		 * String userId = vo.getMemId(); MemberVO userFromDB =
		 * memberMapper.getMemberById(userId);
		 */ // 회占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙호화占쏙옙 占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙占쏙옙
		/* String encodedPasswordFromDB = userFromDB.getMemPw(); */
	  	memberMapper.delete(vo);
		/*
		 * if (passwordEncoder.matches(password, encodedPasswordFromDB)) {
		 * memberMapper.delete(vo); // 占쏙옙橘占싫� 占쏙옙치占싹몌옙 회占쏙옙 占쏙옙占쏙옙 } else { throw new
		 * Exception("비밀번호가 일치하지 않습니다."); }
		 */
	}

  
  @Override
  @Transactional
  public MemberVO login(LoginDTO dto) throws Exception {
      String memId = dto.getMemId();
      String rawPassword = dto.getMemPw(); // 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙橘占싫�

      MemberVO member = memberMapper.getMemberById(memId); // 占쏙옙占� 占쏙옙占쏙옙 占쏙옙회 (占쏙옙占쏙옙)

      if (member != null) {
          String encodedPassword = member.getMemPw(); // 占쏙옙占쏙옙占� 占쏙옙호화占쏙옙 占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙占쏙옙
          if (passwordEncoder.matches(rawPassword, encodedPassword)) {
              // 占쏙옙橘占싫� 占쏙옙치
              return member;
          }
      }
      // 占쏙옙橘占싫� 占쏙옙占쏙옙치 占실댐옙 占쏙옙占쏙옙微占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
      return null;
  }
  
  @Override
  @Transactional
  public void keepLogin(String param1, String param2, Date param3)
      throws Exception {
    
    memberMapper.keepLogin(param1, param2, param3);
    
  }

  @Override
  @Transactional
  public MemberVO checkLoginBefore(String value) {
    
    return memberMapper.checkUserWithSessionKey(value);
  }
}


