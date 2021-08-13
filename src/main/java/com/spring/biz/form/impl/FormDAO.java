package com.spring.biz.form.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.form.CommonVO;
import com.spring.biz.form.FormVO;
import com.spring.biz.form.SeqnotblVO;

@Repository("formDAO")
public class FormDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertForm(FormVO vo) {
		mybatis.insert("FormDAO.insertForm", vo);
	}

	public void insertCustomer(FormVO vo) {
		mybatis.insert("FormDAO.insertCustomer", vo);
	}

	public void insertCard(FormVO vo) {
		mybatis.insert("FormDAO.insertCard", vo);
	}

	public void insertBill(FormVO vo) {
		mybatis.insert("FormDAO.insertBill", vo);
	}

	public void updateCustNo(SeqnotblVO vo) {
		mybatis.update("FormDAO.updateCustNo", vo);
	}

	public void updateCrdNo(SeqnotblVO vo) {
		mybatis.update("FormDAO.updateCrdNo", vo);
	}

	public void updateForm(FormVO vo) {
		mybatis.update("FormDAO.updateForm", vo);
	}

	// 개별보기
	public FormVO getForm(FormVO vo) {
		return (FormVO) mybatis.selectOne("FormDAO.getForm", vo);
	}

	// 목록보기
	public List<FormVO> getFormList(FormVO vo) {
		return mybatis.selectList("FormDAO.getFormList", vo);
	}

	public List<CommonVO> getApplClasList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getApplClasList", vo);
	}

	public List<CommonVO> getBrdList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getBrdList", vo);
	}

	public List<CommonVO> getStlDdList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getStlDdList", vo);
	}

	public List<CommonVO> getStlMtdList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getStlMtdList", vo);
	}

	public List<CommonVO> getBnkCdList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getBnkCdList", vo);
	}

	public List<CommonVO> getStmtSndMtdList(CommonVO vo) {
		return mybatis.selectList("FormDAO.getStmtSndMtdList", vo);
	}

	public FormVO selectImpsb01(FormVO vo) {
		return (FormVO) mybatis.selectOne("FormDAO.selectImpsb01", vo);
	}

	public int selectImpsb04_11(FormVO vo) {
		int result = mybatis.selectOne("FormDAO.selectImpsb04_11", vo);
		return result;
	}

	public void insertMember_impsb(FormVO vo) {
		mybatis.selectOne("FormDAO.insertMember_impsb", vo);

	}

	public void insertMember(FormVO vo) {
		mybatis.insert("FormDAO.insertMember", vo);
	}

	public int selectImpsb04_21(FormVO vo) {
		int result = mybatis.selectOne("FormDAO.selectImpsb04_21", vo);
		return result;
	}

	public List<FormVO> selectAppl_d(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAppl_d", vo);
	}

	public List<FormVO> selectAppl_clas(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAppl_clas", vo);
	}

	public List<FormVO> selectAppl_d_Appl_clas(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAppl_d_Appl_clas", vo);
	}

	public List<FormVO> selectSsn(FormVO vo) {
		return mybatis.selectList("FormDAO.selectSsn", vo);
	}

	public List<FormVO> selectAppl_d_ssn(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAppl_d_ssn", vo);
	}

	public List<FormVO> selectAppl_clas_ssn(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAppl_clas_ssn", vo);
	}

	public List<FormVO> selectAll(FormVO vo) {
		return mybatis.selectList("FormDAO.selectAll", vo);
	}

}
