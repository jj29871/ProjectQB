package onet.com.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {

	@Autowired
	private CommonService commonService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private TeacherService teacherService;

	// 강사 notice 관련
	/* 민지:10.08 강사 메인추가 */
	   @RequestMapping("teacherMain.do")
	   public String teacherMain(Model model, Principal principal) {
	      String member_id = principal.getName();
	      System.out.println(member_id);
	      List<NoticeDto> notice = commonService.teacher_student_Main(member_id);
	      model.addAttribute("notice", notice);
	      List<Exam_infoDto> exam_info = commonService.exam_info(member_id);
	      model.addAttribute("exam_info", exam_info);
	      
	      /*for(int i=0; i<exam_info.size();i++) {
	         System.out.println(exam_info.get(i).getExam_info_name());
	      }*/
	      return "common.teacher.notice.notice";
	   }

	/* 한결 10월 12일 강사 글쓰기 페이지 시작 */
	@RequestMapping("noticeWrite.do")
	public String noticeWrite(String class_name, Model model) {
		System.out.println(class_name);
		model.addAttribute("class_name",class_name);
		return "common.teacher.notice.noticeWrite";
	}
	/* 한결 10월 12일 강사 글쓰기 페이지 끝 */

	/* 10.08 게시판 글 상세보기 페이지 시작 */
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(Model model, String class_name, int notice_num) {
		
		System.out.println("class_name : " + class_name);
		System.out.println("notice_num : " + notice_num);
		List<NoticeDto> result = commonService.noticeDetail(class_name, notice_num);
		model.addAttribute("result", result);
		return "common.teacher.notice.noticeDetail";
	}
	/* 10.08 게시판 글 상세보기 페이지 끝 */

	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate() {

		return "common.teacher.notice.noticeUpdate";
	}

	// 강사 시험 관련
	/* 현이:10.09 시험 일정 상세보기 페이지 시작 */
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail(Model model, int exam_info_num) {
		
		ExamInfoDto dto = commonService.examScheduleDetail(exam_info_num);
		model.addAttribute("dto", dto);

		return "common.teacher.exam.examScheduleDetail";
	}

	/* 현이:10.09 시험 상세보기 페이지 끝 */

	/* 한결 : 시험일정 > 시험응시 페이지 시작 */
	@RequestMapping("examPaperDo.do")
	public String examPaperDo() {

		return "exam.student.examPaperDo";
	}
	/* 한결 : 시험일정 > 시험응시 페이지 끝 */

	
	
	/* 영준 - 18.10.17 내 시험지 삭제 시작 */
	@RequestMapping(value="teacherMyExamDelete.do", method = RequestMethod.POST)
	public @ResponseBody String teacherMyExamDelete(@RequestBody int exam_paper_num)
	{
		int result = teacherService.examPaperDelete(exam_paper_num);
		String result2 = String.valueOf(result);
		return result2;
	}
	/* 영준 - 18.10.17 내 시험지 삭제 끝 */
	

	
	/* 현이 18.10.11 선생님 시험관리 끝 */

	// 강사 시험지 관련
	/* 영준 18.10.11 시험지 생성 페이지 시작 */
	@RequestMapping("examPaperMake.do")
	public String examPaperMake(Model model, Principal principal) {
		/* 문제 카테고리 */
		List<CategoryDto> list1;
		list1 = adminService.lgCategoryList();
		model.addAttribute("list1", list1);

		List<CategoryDto> list2;
		list2 = adminService.mdCategoryList();
		model.addAttribute("list2", list2);

		List<CategoryDto> list3;
		list3=adminService.smCategoryList();
		model.addAttribute("list3",list3);
		
		List<CategoryDto> levellist;
		levellist = adminService.questionLevelList();
		model.addAttribute("levellist",levellist);

		
		String member_id = principal.getName();
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);


		return "common.teacher.exampaper.examPaperMake";
	}
	
	@RequestMapping("examPaperMake_questionContent.do")
	public @ResponseBody String question_content(String num) {
		System.out.println(num);
		List<Question_choiceDto> question_choice;
		
		return null;
	}
	/* 영준 18.10.11 시험지 생성 페이지 끝 */

	
	
	/* 민지 18.10.10 강사 시험감독 페이지 시작 */
	@RequestMapping("examPaper.do")
	public String examPaper() {

		return "common.teacher.exampaper.examPaper";
	}
	/* 민지 18.10.10 강사 시험감독 페이지 끝 */

	
	
	
	
	/*%%%%%%%%%%%%%%%%%%%%%%%    재훈 시작      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
	
	//강사 - 내 문제함 페이지 문제분류 셀렉트박스 데이터 출력
	@RequestMapping("questionManagement.do")
	public String questionManagement(Model model, Principal principal) throws Exception{
		List<CategoryDto> lgCatList;
		
		lgCatList=adminService.lgCategoryList();
		model.addAttribute("lgCatList",lgCatList);
		
		List<CategoryDto> mdCatList;
		mdCatList=adminService.mdCategoryList();
		model.addAttribute("mdCatList",mdCatList);
		
		List<CategoryDto> smCatList;
		smCatList=adminService.smCategoryList();
		model.addAttribute("smCatList",smCatList);
		
		List<CategoryDto> quesLevelList;
		quesLevelList=adminService.questionLevelList();
		model.addAttribute("quesLevelList",quesLevelList);
		
		String member_id = principal.getName();
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "common.teacher.question.questionManagement";
	}
	
	//강사 - 내 문제함에 본인이 제출한 문제 정보 출력
	@RequestMapping(value="myQuestionView.do")
	public @ResponseBody ModelAndView classListView(@RequestParam("member_id") String member_id) {
		
		List<QuestionDto> question = teacherService.teacherMyQuestion(member_id);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.questionManagement_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		return mv;
	}

	//강사 - 문제 검색기능 
	 @RequestMapping(value="myQuestionSearch.do")
	   public @ResponseBody ModelAndView questionSearch(@RequestParam("lgsearchtype") String lgsearchtype, 
	         @RequestParam("mdsearchtype") String mdsearchtype, @RequestParam("smsearchtype") String smsearchtype,
	         @RequestParam("leveltype") String leveltype, @RequestParam("questiontype") String questiontype,
	         @RequestParam("keyword") String keyword, @RequestParam("member_id") String member_id) {
	    
	     List<QuestionDto> question = teacherService.teacherMyQuestionSearch(lgsearchtype,mdsearchtype,smsearchtype,leveltype,questiontype,keyword,member_id);
	     List<Question_choiceDto> question_choice = teacherService.question_choice();
	      
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("ajax.common.questionManagement_ajax");
	     mv.addObject("question", question);
	     mv.addObject("question_choice",question_choice);
	      
	     return mv;
	  }


	
	//강사 - 새 문제 만들기 
		@RequestMapping(value="insertQuestion.do", method=RequestMethod.POST)
	public String insertQuestion(QuestionDto dto2, Question_choiceDto dto, HttpServletRequest request ) throws Exception {
	
		String[] imgArray = dto.getQuestion_choice_image().split(",");
		List<CommonsMultipartFile> files = dto.getFiles();
		System.out.println("files >> " + files + "\ndto >> " + dto.getQuestion_choice_image());
		String path =  request.getServletContext().getRealPath("resources/upload/board/");
		System.out.println("path >> " + path);
		

		for(int i=0; i<imgArray.length;i++) {
			UUID uuid = UUID.randomUUID();
			String saveFileName = uuid.toString()+ "_" + imgArray[i];
			String saveFile = path + saveFileName;
			System.out.println("name >> " + saveFileName + "\n"+"saveFile >> " + saveFile);
			System.out.println("saveFileName class >> "+saveFileName.getClass());
			
		}
//		file1.transferTo(new File(safeFile1));
//		String[] imgArray;
		
		
		
//		System.out.println(dto.getQuestion_choice_image());
//		imgArray = dto.getQuestion_choice_image().split(",");
//		for(int i=0; i<imgArray.length;i++) {
//		
//			System.out.println(imgArray[i]);
//			String path =  request.getServletContext().getRealPath("resources/upload/question_choice/");
//			UUID uuid = UUID.randomUUID();
//			String savaFile1 = uuid.toString()+"_" + imgArray[i];
//			String safeFile1 = path + savaFile1;
//			if(imgArray[i] != "") {
//				
//				
//			}
//		}
		
		/*
		@RequestMapping(value="noticeView.do", method=RequestMethod.POST)
	public String noticeWrite(NoticeDto dto, Principal principal,MultipartHttpServletRequest request) throws Exception {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		dto.setNotice_date(str);
		
		MultipartFile file1 = request.getFile("files1");
		MultipartFile file2 = request.getFile("files2");
		String originFileName1 = file1.getOriginalFilename();
		String originFileName2 = file2.getOriginalFilename();
		long fileSize1 = file1.getSize();
		long fileSize2 = file2.getSize();
		String path =  request.getServletContext().getRealPath("resources/upload/board/");
		
		UUID uuid = UUID.randomUUID();
		String savaFile1 = uuid.toString()+"_" + originFileName1;
		String saveFile2 = uuid.toString()+"_" + originFileName2;
		
		String safeFile1 = path + savaFile1;
		String safeFile2 = path + saveFile2;
		System.out.println("safeFile : " + safeFile1);
		if(fileSize1 > 0 && fileSize2 > 0) {
			file1.transferTo(new File(safeFile1));
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file1(savaFile1);
			dto.setNotice_file2(saveFile2);
		}else if(fileSize1 > 0 && fileSize2 == 0){
			file1.transferTo(new File(safeFile1));
			dto.setNotice_file1(savaFile1);
		}else if(fileSize2 > 0 && fileSize1 == 0) {
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file2(saveFile2);
		}
		int result = commonService.insertBoardList(dto);
		
	
		return "redirect:teacherMain.do";
	}
		 */
		if (dto2.getQuestion_type().equals("객관식")) {
			adminService.insertQuestion(dto2);
			adminService.insertQuestionChoice(dto2, dto);
			} else {
			adminService.insertQuestion(dto2);
			}
			return "redirect:questionManagement.do";
	}
		
	//강사 - 문제 삭제
		@RequestMapping("singleQuestionDelete.do")
		public @ResponseBody Map<String,Object> singleQuestionDelete(int question_num){
			System.out.println("컨트롤러 진입>>>>>" + question_num);
			Map<String,Object> map = new HashMap <String,Object>();
			int result = commonService.singleQuestionDelete(question_num);
			
			if(result == 0) {
				System.out.println("컨트롤러 if문 >> result 값 0");
				map.put("result", "삭제불가");
			}else {
				System.out.println("컨트롤러 if문 >> result 값 0이 아닐때");
				map.put("result", "삭제가능");
			}
			return map;
		}
		
	//강사 - 문제 수정 버튼 클릭시 확인 창 + 문제가 수정 가능한지 확인하는 기능
		@RequestMapping("singleUpdateCheck.do")
		public @ResponseBody Map<String,Object> singleUpdateCheck(int question_num){
			System.out.println("singleUpdateCheck.do 컨트롤러 진입>>>>>" + question_num);
			Map<String,Object> map = new HashMap <String,Object>();
			int result = commonService.singleUpdateCheck(question_num);
			if(result == 0) {
				System.out.println("컨트롤러 if문 >> result 값 0");
				map.put("result", "삭제불가");
			}else {
				System.out.println("컨트롤러 if문 >> result 값 0이 아닐때");
				map.put("result", "삭제가능");
			}
			return map;
		}
	
	//강사 - 문제 수정 페이지로 이동시 선택한 문제와 보기 정보 데이터를 출력
		@RequestMapping("questionUpdate.do")
		public String questionUpdate(Model model, int question_num) {
			System.out.println("questionUpdate.do 컨트롤러 진입>>> question_num값: " +question_num);
			
			List<QuestionDto> qdto;
			qdto=commonService.questionInfo(question_num);
			model.addAttribute("qdto",qdto);
			
			List<Question_choiceDto> cdto;
			cdto=commonService.questionChoiceInfo(question_num);
			model.addAttribute("cdto",cdto);
			
			List<CategoryDto> qcat;
			qcat=commonService.questionCategoryInfo(question_num);
			model.addAttribute("qcat",qcat);
			
			List<CategoryDto> lgCatList;
			lgCatList=adminService.lgCategoryList();
			model.addAttribute("lgCatList",lgCatList);
			
			List<CategoryDto> mdCatList;
			mdCatList=adminService.mdCategoryList();
			model.addAttribute("mdCatList",mdCatList);
			
			List<CategoryDto> smCatList;
			smCatList=adminService.smCategoryList();
			model.addAttribute("smCatList",smCatList);
			
			List<CategoryDto> quesLevelList;
			quesLevelList=adminService.questionLevelList();
			model.addAttribute("quesLevelList",quesLevelList);
			
			return "common.teacher.question.questionUpdate";
			
		}

	/*%%%%%%%%%%%%%%%%%%%%%%%    재훈 끝       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

	
	/*현이 18.10.09 강사 마이페이지 시작*/
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPageInfo(Model model, Principal principal) throws ClassNotFoundException, SQLException {
		//회준 10.15
		String member_id = principal.getName();
		System.out.println("아이디 : " +member_id);
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "common.teacher.common.myPage";
	}
	/* 현이 18.10.09 학생 마이페이지 끝 */
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.POST)
	public String myPageUpdate(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
			commonService.myPageUpdate(memberDto);
		
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return "common.teacher.common.myPage";
	}
	/*현이 18.10.09 강사 마이페이지 끝*/
	
	/* 양회준 10.15 내정보 탈퇴 시작*/
	@RequestMapping("myPageDrop.do")
	public String myPageDrop(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
			memberDto.setMember_enable("0");
			System.out.println(memberDto.getMember_enable());
			commonService.myPageDrop(memberDto);
		
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return "redirect:/login.jsp";
	}
	/* 양회준 10.15 내정보 탈퇴 끝*/	
	
	
	/*민지 18.10.10 메시지 페이지 시작*/
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.teacher.common.myMessage";
	}
	/*민지 18.10.10 메시지 페이지 끝*/
	
	
	/*양회준 18.10.11 학생&성적관리 추가 */
	@RequestMapping("studentInfo.do")
	public String studentInfo(){		
		return "common.teacher.grade.studentInfo";
	}
	/*양회준 18.10.11 학생&성적관리 끝 */
	
	/* 양회준 10.16 내정보 비밀번호 확인 시작*/
	@RequestMapping(value="memberDrop.do", method=RequestMethod.POST)
	public @ResponseBody int memberDrop(@RequestParam("member_id") String member_id, 
			@RequestParam("member_pwd") String member_pwd) throws IOException, ClassNotFoundException, SQLException {
		System.out.println("intoAjax");
		System.out.println(member_id);
		System.out.println(member_pwd);
		int result = commonService.memberDrop(member_id, member_pwd);		
		return result;
	}
	/* 양회준 10.16 내정보 비밀번호 확인 끝*/
	
	/* 정원 10.22 공지사항 글쓰기*/
	
	@RequestMapping(value="noticeView.do", method=RequestMethod.POST)
	public String noticeWrite(NoticeDto dto, Principal principal,MultipartHttpServletRequest request) throws Exception {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		dto.setNotice_date(str);
		
		MultipartFile file1 = request.getFile("files1");
		MultipartFile file2 = request.getFile("files2");
		String originFileName1 = file1.getOriginalFilename();
		String originFileName2 = file2.getOriginalFilename();
		long fileSize1 = file1.getSize();
		long fileSize2 = file2.getSize();
		String path =  request.getServletContext().getRealPath("resources/upload/board/");
		
		UUID uuid = UUID.randomUUID();
		String savaFile1 = uuid.toString()+"_" + originFileName1;
		String saveFile2 = uuid.toString()+"_" + originFileName2;
		
		String safeFile1 = path + savaFile1;
		String safeFile2 = path + saveFile2;
		System.out.println("safeFile : " + safeFile1);
		if(fileSize1 > 0 && fileSize2 > 0) {
			file1.transferTo(new File(safeFile1));
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file1(savaFile1);
			dto.setNotice_file2(saveFile2);
		}else if(fileSize1 > 0 && fileSize2 == 0){
			file1.transferTo(new File(safeFile1));
			dto.setNotice_file1(savaFile1);
		}else if(fileSize2 > 0 && fileSize1 == 0) {
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file2(saveFile2);
		}
		int result = commonService.insertBoardList(dto);
		
	
		return "redirect:teacherMain.do";
	}
	
	
	
	
	
	

}