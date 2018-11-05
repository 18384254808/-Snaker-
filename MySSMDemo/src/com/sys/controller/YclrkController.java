package com.sys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.pojo.Yclrk;
import com.sys.service.YclrkService;

@Controller
public class YclrkController {
	@Autowired
	private YclrkService yclrkService;
	@RequestMapping("getAll.do")
	@ResponseBody
	public List<Yclrk> getAll() throws Exception{
		System.out.println("进入getAll");
		return yclrkService.getAllYcllrk();
	}
	@RequestMapping("Yclrk.do")
	public String getYclrk(){
		System.out.println("进入请求页面");
		return "Yclrk";
	}
}
