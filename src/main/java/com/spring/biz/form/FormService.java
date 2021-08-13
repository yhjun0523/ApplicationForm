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

	FormVO selectImpsb01(FormVO vo);

	int selectImpsb04_11(FormVO vo);

	void insertMember_impsb(FormVO vo);

	void insertMember(FormVO vo);

	int selectImpsb04_21(FormVO vo);
	
	List<FormVO> selectAppl_d(FormVO vo);
	
	List<FormVO> selectAppl_clas(FormVO vo);
	
	List<FormVO> selectAppl_d_Appl_clas(FormVO vo);
	
	List<FormVO> selectSsn(FormVO vo);
	
	List<FormVO> selectAppl_d_ssn(FormVO vo);
	
	List<FormVO> selectAppl_clas_ssn(FormVO vo);

	List<FormVO> selectAll(FormVO vo);
	
	
}
