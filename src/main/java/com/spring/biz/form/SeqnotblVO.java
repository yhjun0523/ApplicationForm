package com.spring.biz.form;

public class SeqnotblVO {

	private String custNo;

	private String crdNo;

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCrdNo() {
		return crdNo;
	}

	public void setCrdNo(String crdNo) {
		this.crdNo = crdNo;
	}

	@Override
	public String toString() {
		return "SeqnotblVO [custNo=" + custNo + ", crdNo=" + crdNo + "]";
	}
}