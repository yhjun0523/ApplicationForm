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

	public int ssnCheck(FormVO vo) throws Exception {
		int result = mybatis.selectOne("FormDAO.ssnCheck", vo);
		return result;
	}

	public int brdCheck(FormVO vo) throws Exception {
		int result = mybatis.selectOne("FormDAO.brdCheck", vo);
		return result;
	}
}
