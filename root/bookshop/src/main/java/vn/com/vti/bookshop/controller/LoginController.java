package vn.com.vti.bookshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bookshop.form.LoginForm;

@Controller
public class LoginController {
	@ModelAttribute
	public LoginForm createForm() {
		return new LoginForm();
	}

	@RequestMapping("/login")
	public String login(LoginForm loginForm) {

		return "login";
	}
}
