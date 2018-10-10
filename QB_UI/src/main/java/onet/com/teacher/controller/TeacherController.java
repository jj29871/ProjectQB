package onet.com.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {

	@RequestMapping("teacherNoticeWrite.do")
	public String teacherNoticeWrite() {

		return "teacher.teacherNoticeWrite";
	}

	/* 민지:10.08 강사 메인추가 */
	@RequestMapping("teacherMain.do")
	public String teacherMain() {

		return "teacher.teacherMain";
	}
	
	/*재훈:10.08 게시판 글 상세보기 페이지 시작*/
	@RequestMapping("noticeView.do")
	public String noticeView() {

		return "common.noticeView";
	}
	/*재훈:10.08 게시판 글 상세보기 페이지 끝*/
	
	/*영준:10.08 내 시험지 보기 페이지 시작 */
	@RequestMapping("teacherMyExamPaper.do")
	public String teacherMyExamPaper() {

		return "teacher.teacherMyExamPaper";
	}
	/*영준:10.08 내 시험지 보기 페이지 끝 */
	
	/*영준:10.08 임시 저장된 시험지 보기 페이지 시작 */
	@RequestMapping("teacherTempExamPaper.do")
	public String teacherTempExamPaper() {

		return "teacher.teacherTempExamPaper";
	}
	/*영준:10.08 임시 저장된 시험지 보기 페이지 끝 */
	
	/*영준:10.08 시험 일정보기 페이지 시작 */
	@RequestMapping("teacherExamSchedule.do")
	public String teacherExamSchedule() {

		return "teacher.teacherExamSchedule";
	}
	/*영준:10.08 시험 일정보기 페이지 끝 */
	
	/*회준:10.08 시험 일정등록/수정 페이지 시작 */
	@RequestMapping("teacherExamPaperUpdate.do")
	public String teacherExamPaperUpdate() {

		return "teacher.teacherExamPaperUpdate";
	}
	/*회준:10.08 시험 일정등록/수정 페이지 끝 */
	
	/*현이:10.09 시험 일정 상세보기 페이지 시작*/
	@RequestMapping("examScheduleDetail.do")
	public String examDetailView() {
		
		return "common.teacher.examScheduleDetail";
	}  
	/*현이:10.09 시험 상세보기 페이지 끝*/
	
	/*현이 18.10.09 강사 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.teacher.myPage";
	}
	/*현이 18.10.09 강사 마이페이지 끝*/
	
	/*민지 18.10.10 강사 시험감독 페이지 시작*/
	@RequestMapping("teacherExamPaper.do")
	public String teacherExamPaper() {

		return "teacher.teacherExamPaper";
	}
	/*민지 18.10.10 강사 시험감독 페이지 끝*/
	
	/*민지 18.10.10 메시지 페이지 시작*/
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.teacher.myMessage";
	}
	/*민지 18.10.10 메시지 페이지 끝*/
	
	
	
}