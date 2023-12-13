package org.rankingbox.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rankingbox.domain.MemberVO;
import org.rankingbox.dto.LoginDTO;
import org.rankingbox.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/user")
public class MemberController {

  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
  @Inject
  private MemberService service; 

  
 
  @RequestMapping(value = "/register", method = RequestMethod.GET) 
  public void registerGET() throws Exception {
	  logger.info("get register");
  }
  
  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				service.register(vo);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/user/registerSuccess";
	}
		
  
  @RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
  public void registerSuccess() throws Exception {
	  logger.info("register Success");
  }
  
  @ResponseBody
  @RequestMapping(value="/idChk", method = RequestMethod.POST)
  public int idChk(MemberVO vo) throws Exception {
  	int result = service.idChk(vo);
  	return result;
  }
  
  
  @RequestMapping(value = "/modify", method = RequestMethod.GET)
  public void modifyGET() throws Exception {
	  logger.info("get modify");
  }
  
  @RequestMapping(value = "/modify", method = RequestMethod.POST)
  public String modifyPOST(MemberVO vo,@RequestParam String newPassword) throws Exception {
     
     service.modify(vo, newPassword);
     
     return "redirect:/user/modifySuccess";
  }
  
  @RequestMapping(value = "/modifySuccess", method = RequestMethod.GET)
  public void modifySuccess() throws Exception {
	  logger.info("modify Success");
  }
  
  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public void deleteGET(MemberVO vo) throws Exception {
	  logger.info("get delete");
  }
  
  @RequestMapping(value = "/delete", method = RequestMethod.POST)
  public String deletePOST(MemberVO vo) throws Exception {
	  
	  service.delete(vo);
	  
	  return "redirect:/user/deleteSuccess";
  }

  @RequestMapping(value = "/deleteSuccess", method = RequestMethod.GET)
  public void deleteSuccess(MemberVO vo) throws Exception {
	  logger.info("delete success");
  }
  
  
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

  }
  
  @RequestMapping(value = "/loginFail", method = RequestMethod.GET)
  public void loginFail(@ModelAttribute("dto") LoginDTO dto) {
	  

  }
  
  @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

    MemberVO vo = service.login(dto);

    if (vo == null) {
      return "user/loginFail";
    }
    
    System.out.println(session.getId());

    model.addAttribute("memberVO", vo);

    if (dto.isUseCookie()) {

      int amount = 60 * 60 * 24 * 7;

      Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

      service.keepLogin(vo.getMemId(), session.getId(), sessionLimit);
    }
    
    return "/index";
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpServletRequest request, 
      HttpServletResponse response, HttpSession session) throws Exception {

    Object obj = session.getAttribute("login");

    if (obj != null) {
      MemberVO vo = (MemberVO) obj;

      session.removeAttribute("login");
      session.invalidate();

      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

      if (loginCookie != null) {
        loginCookie.setPath("/");
        loginCookie.setMaxAge(0);
        response.addCookie(loginCookie);
        service.keepLogin(vo.getMemId(), session.getId(), new Date());
      }
    }
    
    return "user/logout";
  }

  
  @RequestMapping(value = "/myPage", method = RequestMethod.GET)
  public void myPageGet(@ModelAttribute("dto") LoginDTO dto) {

  }
  
  
}
