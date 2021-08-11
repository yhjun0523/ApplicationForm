package com.spring.biz.form;

import java.util.List;

public interface FormService {
	void insertForm(FormVO vo);

	void insertCustomer(FormVO vo);

	void insertCard(FormVO vo);

	void insertBill(FormVO vo);

	void updateCrdNo(SeqnotblVO vo);

	void updateCustNo(SeqnotblVO vo);

	void updateForm(FormVO vo);

	FormVO getForm(FormVO vo);

	List<FormVO> getFormList(FormVO vo);

	List<CommonVO> getApplClasList(CommonVO vo);

	List<CommonVO> getBrdList(CommonVO vo);

	List<CommonVO> getStlDdList(CommonVO vo);

	List<CommonVO> getStlMtdList(CommonVO vo);

	List<CommonVO> getBnkCdList(CommonVO vo);

	List<CommonVO> getStmtSndMtdList(CommonVO vo);

	int ssnCheck(FormVO vo) throws Exception;

	int brdCheck(FormVO vo) throws Exception;
}
