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

import pw.dao.ProfiloDao;
import pw.model.Profilo;

@Controller
@RequestMapping("/login")
public class FormLoginController {
	
	@Autowired
	private ProfiloDao profiloDao;

	@GetMapping
	public String getPage(Model model, @RequestParam(name = "le", required = false) String lError) {
		boolean loginError = lError != null;
		model.addAttribute("loginError", loginError);
		model.addAttribute("title", "User Login");
		model.addAttribute("profilo", new Profilo());
		return "FormAccesso";
	}
	
	@PostMapping
	public String userLogin(@RequestParam(name = "username", required = false) String username, @RequestParam(name = "password", required = false) String password, HttpSession session) {
		List<Profilo> profili = (List<Profilo>) profiloDao.findAll();
	    boolean exists = false;
	    for (int i = 0; i < profili.size(); i++) {
	        if (profili.get(i).getUsername().equals(username) && profili.get(i).getPassword().equals(password)) {
	            session.setAttribute("username", username);
	            session.setAttribute("userid", profili.get(i).getId());
	            exists = true;
	            break;
	        }
	    }
	
	    if (exists) {
	        return "redirect:/";
	    } else {
	        return "redirect:/login?le";
	    }
	}
	
}
