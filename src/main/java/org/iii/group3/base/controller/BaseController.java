package org.iii.group3.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
}
