package com.spring.biz.form;

public class CommonVO {
	private String groupCd;

	private String groupNm;

	private String code;

	private String codeNm;

	private String etcCd1;

	private String etcCd2;

	private String etcCd3;

	private String remark;

	public String getGroupCd() {
		return groupCd;
	}

	public void setGroupCd(String groupCd) {
		this.groupCd = groupCd;
	}

	public String getGroupNm() {
		return groupNm;
	}

	public void setGroupNm(String groupNm) {
		this.groupNm = groupNm;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getEtcCd1() {
		return etcCd1;
	}

	public void setEtcCd1(String etcCd1) {
		this.etcCd1 = etcCd1;
	}

	public String getEtcCd2() {
		return etcCd2;
	}

	public void setEtcCd2(String etcCd2) {
		this.etcCd2 = etcCd2;
	}

	public String getEtcCd3() {
		return etcCd3;
	}

	public void setEtcCd3(String etcCd3) {
		this.etcCd3 = etcCd3;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "CommonVO [groupCd=" + groupCd + ", groupNm=" + groupNm + ", code=" + code + ", codeNm=" + codeNm
				+ ", etcCd1=" + etcCd1 + ", etcCd2=" + etcCd2 + ", etcCd3=" + etcCd3 + ", remark=" + remark + "]";
	}

}
