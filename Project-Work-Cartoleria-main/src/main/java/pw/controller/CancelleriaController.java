package pw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pw.service.ProdottoService;

@Controller
@RequestMapping("/cancelleria")
public class CancelleriaController {
	
	@Autowired
	ProdottoService prodottoService;

	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "Cancelleria");
		model.addAttribute("prodotti", prodottoService.getProdotto("cancelleria"));
		return "cancelleria";
	}
	
}
