package com.spring.biz.form.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.form.CommonVO;
import com.spring.biz.form.FormService;
import com.spring.biz.form.FormVO;
import com.spring.biz.form.SeqnotblVO;

@Service("formService")
public class FormServiceImpl implements FormService {

	@Autowired
	private FormDAO formDAO;

	public FormServiceImpl() {
	}

	public void insertForm(FormVO vo) {
		formDAO.insertForm(vo);
	}

	public void insertCustomer(FormVO vo) {
		formDAO.insertCustomer(vo);
	}

	public void insertCard(FormVO vo) {
		formDAO.insertCard(vo);
	}

	public void insertBill(FormVO vo) {
		formDAO.insertBill(vo);
	}

	public void updateCustNo(SeqnotblVO vo) {
		formDAO.updateCustNo(vo);
	}

	public void updateCrdNo(SeqnotblVO vo) {
		formDAO.updateCrdNo(vo);
	}

	public void updateForm(FormVO vo) {
		formDAO.updateForm(vo);
	}

	public FormVO getForm(FormVO vo) {
		return formDAO.getForm(vo);
	}

	public List<FormVO> getFormList(FormVO vo) {
		return formDAO.getFormList(vo);
	}

	public List<CommonVO> getApplClasList(CommonVO vo) {
		return formDAO.getApplClasList(vo);
	}

	public List<CommonVO> getBrdList(CommonVO vo) {
		return formDAO.getBrdList(vo);
	}

	public List<CommonVO> getStlDdList(CommonVO vo) {
		return formDAO.getStlDdList(vo);
	}

	public List<CommonVO> getStlMtdList(CommonVO vo) {
		return formDAO.getStlMtdList(vo);
	}

	public List<CommonVO> getBnkCdList(CommonVO vo) {
		return formDAO.getBnkCdList(vo);
	}

	public List<CommonVO> getStmtSndMtdList(CommonVO vo) {
		return formDAO.getStmtSndMtdList(vo);
	}

	public FormVO selectImpsb01(FormVO vo) {
		return formDAO.selectImpsb01(vo);
	}

	public int selectImpsb04_11(FormVO vo) {
		int result = formDAO.selectImpsb04_11(vo);
		return result;
	}

	public void insertMember_impsb(FormVO vo) {
		formDAO.insertMember_impsb(vo);
	}

	public void insertMember(FormVO vo) {
		formDAO.insertMember(vo);
	}

	public int selectImpsb04_21(FormVO vo) {
		int result = formDAO.selectImpsb04_21(vo);
		return result;
	}

	public List<FormVO> selectAppl_d(FormVO vo) {
		return formDAO.selectAppl_d(vo);
	}

	public List<FormVO> selectAppl_clas(FormVO vo) {
		return formDAO.selectAppl_clas(vo);
	}

	public List<FormVO> selectAppl_d_Appl_clas(FormVO vo) {
		return formDAO.selectAppl_d_Appl_clas(vo);
	}

	public List<FormVO> selectSsn(FormVO vo) {
		return formDAO.selectSsn(vo);
	}

	public List<FormVO> selectAppl_d_ssn(FormVO vo) {
		return formDAO.selectAppl_d_ssn(vo);
	}

	public List<FormVO> selectAppl_clas_ssn(FormVO vo) {
		return formDAO.selectAppl_clas_ssn(vo);
	}

	public List<FormVO> selectAll(FormVO vo) {
		return formDAO.selectAll(vo);
	}

}
