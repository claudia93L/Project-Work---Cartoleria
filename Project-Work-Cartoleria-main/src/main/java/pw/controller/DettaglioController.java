package pw.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.service.ProdottoService;
import pw.model.Prodotto;

@Controller
@RequestMapping("/dettaglio")
public class DettaglioController {

	@Autowired
	ProdottoService prodottoService;
	
	String redirect;
	
	@GetMapping
	public String getPage(Model model, @RequestParam("id") int id, @RequestParam(name = "add", required = false) String add, @RequestParam("redirect") String red) {
		redirect = red;
		model.addAttribute("title", "Dettaglio Prodotto");
		model.addAttribute("prodotto", prodottoService.getProdottoById(id));
		model.addAttribute("add", add != null);
		model.addAttribute("redirect", redirect);
		return "dettaglio";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/aggiungi")
	public String aggiungi(@RequestParam("id") int id, HttpSession session) {
		Prodotto prodotto = prodottoService.getProdottoById(id);
		List<Prodotto> carrello = session.getAttribute("carrello") == null ? new ArrayList<>() : (List<Prodotto>) session.getAttribute("carrello");
		carrello.add(prodotto);
		session.setAttribute("carrello", carrello);
		return "redirect:/dettaglio?add&id=" + id + "&redirect=" + redirect;
	}

}
