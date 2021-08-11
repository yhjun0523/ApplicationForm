package com.spring.view.form;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		System.out.println("write : " + vo);

		formService.insertForm(vo);
		formService.insertCustomer(vo);
		formService.insertCard(vo);
		formService.insertBill(vo);
		formService.updateCustNo(seq);
		formService.updateCrdNo(seq);
		return "form.do";
	}

	@RequestMapping("/update.do")
	public String updateForm(@ModelAttribute("form") FormVO vo) {
		formService.updateForm(vo);
		return "form.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/detail.do", produces = "application/json")
	public String getForm(FormVO vo, @RequestParam("ssn") String ssn) throws JsonProcessingException {
		System.out.println(ssn);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("ssn", ssn);
		vo.setSsn(ssn);
		Map<String, Object> hashmap = new HashMap<String, Object>();
		FormVO form = formService.getForm(vo);
		hashmap.put("form", form);
		System.out.println(form);
		ObjectMapper mapper = new ObjectMapper(); // jsonview
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashmap);
		System.out.println(json);
		return json;
	}

	@RequestMapping("/list.do")
	public String getFormList(FormVO vo, CommonVO comm, Model model) {

		model.addAttribute("applClasList", formService.getApplClasList(comm));
		model.addAttribute("formList", formService.getFormList(vo));
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

	@ResponseBody
	@RequestMapping(value = "/ssnChk.do", method = RequestMethod.POST)
	public int ssnCheck(FormVO vo) throws Exception {
		int result = formService.ssnCheck(vo);
		System.out.println("ssbChk: " + result);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/brdChk.do", method = RequestMethod.POST)
	public int brdCheck(FormVO vo) throws Exception {
		int result = formService.brdCheck(vo);
		System.out.println("brdChk: " + result);
		return result;
	}

}
