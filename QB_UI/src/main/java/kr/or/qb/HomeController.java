package kr.or.qb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@RequestMapping("index.do")
	   public String login() {
	     
	      return "join.login";
	   }
	
	@RequestMapping("adminCategory.do")
	   public String adminCategory() {
	     
	      return "admin.adminCategory";
	   }
	
	
	@RequestMapping("admin_management.do")
	   public String admin_management() {
	     
	      return "admin.admin_management";
	   }
	
	// 관리자 회원관리(영준)
	@RequestMapping("adminMember.do")
	   public String adminMember() {
	     
	      return "admin.adminMember";
	   }
	
}
