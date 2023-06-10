package kr.or.ddit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.EmpMapper;
import kr.or.ddit.vo.EmployeeVO;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Inject
	private EmpMapper mapper;
	
	@Override
	public List<EmployeeVO> selectEmployees() {
		// TODO Auto-generated method stub
		return mapper.selectEmployees();
	}

}
