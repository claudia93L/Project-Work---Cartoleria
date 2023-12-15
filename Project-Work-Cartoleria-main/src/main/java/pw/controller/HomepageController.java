package pw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomepageController {

	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "Homepage");
		return "Homepage";
	}

}
