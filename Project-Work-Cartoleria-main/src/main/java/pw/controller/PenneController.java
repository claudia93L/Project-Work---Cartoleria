package pw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pw.service.ProdottoService;

@Controller
@RequestMapping("/penne")
public class PenneController {

	@Autowired
	ProdottoService prodottoService;

	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "Penne Stilografiche");
		model.addAttribute("prodotti", prodottoService.getProdotto("penne"));
		return "penne";
	}
}
