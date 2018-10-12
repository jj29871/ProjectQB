package onet.com.index.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.index.service.IndexService;
import onet.com.vo.MemberDto;

@Controller
@RequestMapping("/index/")
public class IndexController {

	@Autowired
	private IndexService indexService;

	
	
	@RequestMapping("memberjoin.do")
	public String memberjoin() {

		return "home.memberJoin";
	}

	@RequestMapping("idSearch.do")
	public String idSearch() {

		return "home.findId";
	}
	
	@RequestMapping(value="idSearch.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> idSearch(String membername, String mailto) {
		MemberDto dto = new MemberDto();
		dto.setMember_name(membername);
		dto.setMember_email(mailto);
		Map<String, Object> map = new HashMap<String, Object>();
		String result = indexService.idSearch(dto);
		System.out.println(result);
		map.put("result", result);
		return map;
	}
	
	
	@RequestMapping(value="pwdSearch.do")
	public String pwdSearch() {

		return "home.findPw";
	}
	
	

	@RequestMapping("noAuth.do")
	public String join(){
		return "home.noAuth";
		
	}

	@RequestMapping(value="insertmember.do", method=RequestMethod.POST)
	public String  memberInsert(MemberDto dto) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		String viewpage="";
		
		result = indexService.insertMember(dto);
		
		if(result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/login.jsp";
		}else {
			System.out.println("가입실패");
			 viewpage = "memberjoin.do";
		}
		return viewpage;
	}
	
	@RequestMapping(value="joinCheckId.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> idCheck(@RequestParam("member_id") String member_id) {
		String memberid = indexService.joinCheckId(member_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", memberid == null);
		map.get("result");
		return map;
	}
	
	@RequestMapping(value = "mail.do",  method = RequestMethod.POST)
	public @ResponseBody String mail(String mailto) {
		
		String randomNum = indexService.sendMail(mailto, "join");// 회원가입 메일발송
		System.out.println("randomNum>>"+randomNum);
		return randomNum;
	}

}
