package onet.com.admin.dao;

import java.util.List;

import onet.com.vo.CategoryDto;

public interface AdminDao {
	/*재훈 - 10.08 문제분류관련 시작*/
	public List<CategoryDto> lgCategoryList();
	public List<CategoryDto> mdCategoryList();
	public List<CategoryDto> smCategoryList();
	
	/*재훈 - 10.08 문제분류관련 시작*/
}
