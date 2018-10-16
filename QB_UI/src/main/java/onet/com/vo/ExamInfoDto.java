package onet.com.vo;

import java.sql.Time;
import java.sql.Date;

public class ExamInfoDto {
	
	private int exam_info_num;
	private int exam_paper_num;
	private String class_name;         
	private String exam_info_name;
	private String exam_info_desc;
	private String exam_info_member;
	private Date exam_info_date;
	private Time exam_info_start;
	private Time exam_info_end;
	private Time exam_info_time;
	
	public int getExam_info_num() {
		return exam_info_num;
	}
	public void setExam_info_num(int exam_info_num) {
		this.exam_info_num = exam_info_num;
	}
	public int getExam_paper_num() {
		return exam_paper_num;
	}
	public void setExam_paper_num(int exam_paper_num) {
		this.exam_paper_num = exam_paper_num;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getExam_info_name() {
		return exam_info_name;
	}
	public void setExam_info_name(String exam_info_name) {
		this.exam_info_name = exam_info_name;
	}
	public String getExam_info_desc() {
		return exam_info_desc;
	}
	public void setExam_info_desc(String exam_info_desc) {
		this.exam_info_desc = exam_info_desc;
	}
	public String getExam_info_member() {
		return exam_info_member;
	}
	public void setExam_info_member(String exam_info_member) {
		this.exam_info_member = exam_info_member;
	}
	public Date getExam_info_date() {
		return exam_info_date;
	}
	public void setExam_info_date(Date exam_info_date) {
		this.exam_info_date = exam_info_date;
	}
	public Time getExam_info_start() {
		return exam_info_start;
	}
	public void setExam_info_start(Time exam_info_start) {
		this.exam_info_start = exam_info_start;
	}
	public Time getExam_info_end() {
		return exam_info_end;
	}
	public void setExam_info_end(Time exam_info_end) {
		this.exam_info_end = exam_info_end;
	}
	public Time getExam_info_time() {
		return exam_info_time;
	}
	public void setExam_info_time(Time exam_info_time) {
		this.exam_info_time = exam_info_time;
	}
	
	
	
}
