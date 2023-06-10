package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.EmployeeVO;

public interface EmpMapper {

	List<EmployeeVO> selectEmployees();

}
