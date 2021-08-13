package com.spring.view.form;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.biz.form.CommonVO;
import com.spring.biz.form.FormService;
import com.spring.biz.form.FormVO;
import com.spring.biz.form.SeqnotblVO;

@Controller
@SessionAttributes("form")
public class FormController {

	@Autowired
	private FormService formService;

	@RequestMapping(value = "/write.do")
	public String insertForm(FormVO vo, SeqnotblVO seq, HttpServletRequest request) throws Exception {
		FormVO bean = formService.selectImpsb01(vo);

		if (bean == null) {
			if (vo.getApplClas().equals("11") || vo.getApplClas().equals("12")) {
				int Impsb04cnt = formService.selectImpsb04_11(vo);

				if (Impsb04cnt >= 1) {
					vo.setImpsbClas("1");
					vo.setImpsbCd("04");
					System.out.println(vo);
					formService.insertMember_impsb(vo);
					formService.updateCustNo(seq);

				} else {
					formService.insertMember(vo);
					formService.insertCustomer(vo);
					formService.insertCard(vo);
					formService.insertBill(vo);
					formService.updateCustNo(seq);
					formService.updateCrdNo(seq);
				}
			}
			if (vo.getApplClas().equals("21")) {
				int cnt = formService.selectImpsb04_21(vo);

				if (cnt < 1) {
					vo.setImpsbClas("1");
					vo.setImpsbCd("05");
					formService.insertMember_impsb(vo);
					formService.updateCustNo(seq);
				} else {
					formService.insertMember(vo);
					formService.insertCustomer(vo);
					formService.insertCard(vo);
					formService.insertBill(vo);
					formService.updateCustNo(seq);
					formService.updateCrdNo(seq);
				}
			}
		} else {
			vo.setImpsbClas("1");
			vo.setImpsbCd("01");
			formService.insertMember_impsb(vo);
			formService.updateCustNo(seq);
		}

		return "index.jsp";
	}

	@RequestMapping("/update.do")
	public String updateForm(@ModelAttribute("form") FormVO vo) {
		formService.updateForm(vo);
		return "form.jsp";
	}

	@RequestMapping(value = "/detail.do", produces = "application/json")
	public String getForm(FormVO vo, CommonVO comm, Model model) {
		System.out.println(vo);
		model.addAttribute("formDetail", formService.getForm(vo));
		System.out.println(formService.getForm(vo));
		model.addAttribute("applClasList", formService.getApplClasList(comm));
		model.addAttribute("brdList", formService.getBrdList(comm));
		model.addAttribute("stlDdList", formService.getStlDdList(comm));
		model.addAttribute("stlMtdList", formService.getStlMtdList(comm));
		model.addAttribute("bnkCdList", formService.getBnkCdList(comm));
		model.addAttribute("stmtSndMtdList", formService.getStmtSndMtdList(comm));
		return "form.jsp";
	}

	@RequestMapping("/list.do")
	public String getFormList(FormVO vo, CommonVO comm, Model model) {
		if (vo.getSsn().isEmpty()) {
			if (vo.getApplClas() == "") {
				model.addAttribute("searchList", formService.selectAppl_d(vo));
			} else if (vo.getApplD1() == "") {
				model.addAttribute("searchList", formService.selectAppl_clas(vo));
			} else {
				model.addAttribute("searchList", formService.selectAppl_d_Appl_clas(vo));
			}
		} else if (vo.getApplClas() == "") {
			if (vo.getApplD1() == "") {
				model.addAttribute("searchList", formService.selectSsn(vo));
			} else {
				model.addAttribute("searchList", formService.selectAppl_d_ssn(vo));
			}
		} else if (vo.getApplD1() == "") {
			model.addAttribute("searchList", formService.selectAppl_clas_ssn(vo));
		} else {
			model.addAttribute("searchList", formService.selectAll(vo));
		}

		model.addAttribute("applClasList", formService.getApplClasList(comm));
		return "search.jsp";
	}

	@RequestMapping("/form.do")
	public String getMenuList(CommonVO vo, Model model) {

		model.addAttribute("applClasList", formService.getApplClasList(vo));
		model.addAttribute("brdList", formService.getBrdList(vo));
		model.addAttribute("stlDdList", formService.getStlDdList(vo));
		model.addAttribute("stlMtdList", formService.getStlMtdList(vo));
		model.addAttribute("bnkCdList", formService.getBnkCdList(vo));
		model.addAttribute("stmtSndMtdList", formService.getStmtSndMtdList(vo));
		return "form.jsp";
	}

	@RequestMapping("/search.do")
	public String getSearchMenuList(CommonVO vo, Model model) {

		model.addAttribute("applClasList", formService.getApplClasList(vo));
		return "search.jsp";
	}

	// 글 상세 조회
	@RequestMapping(value = "/getReviewDetail.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String load(FormVO vo, @RequestParam("ssn") String ssn, @RequestParam("rcvSeqNo") String rcvSeqNo)
			throws JsonProcessingException {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("ssb", ssn);
		paramMap.put("rcvSeqNo", rcvSeqNo);
		vo.setSsn(ssn);
		Map<String, Object> hashmap = new HashMap<String, Object>();
//		FormVO form = formService.load(vo);
		ObjectMapper mapper = new ObjectMapper(); // jsonview
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashmap);
		return json;
	}
}
