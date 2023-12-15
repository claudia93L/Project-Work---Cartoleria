package pw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.AdminDao;
import pw.model.Admin;

@Controller
@RequestMapping("/adminlogin")
public class FormLoginAdminController {
	
	@Autowired
	private AdminDao adminDao;

	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "User Login");
		model.addAttribute("admin", new Admin());
		return "FormAccessoAdmin";
	}
	
	@PostMapping
	public String userLogin(@RequestParam(name = "username", required = false) String username, @RequestParam(name = "password", required = false) String password, @RequestParam(name = "le", required = false) String lError, HttpSession session, Model model) {
		boolean loginError = lError != null;
		model.addAttribute("loginError", loginError);
		List<Admin> profili = (List<Admin>) adminDao.findAll();
	    boolean exists = false;
	    for (int i = 0; i < profili.size(); i++) {
	        if (profili.get(i).getUsername().equals(username) && profili.get(i).getPassword().equals(password)) {
	            session.setAttribute("username", username);
	            exists = true;
	            break;
	        }
	    }
	
	    if (exists) {
	        return "redirect:/admin";
	    } else {
	        return "redirect:/adminlogin?le";
	    }
	}
	
}
