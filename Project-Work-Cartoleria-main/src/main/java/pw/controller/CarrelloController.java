package pw.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.UtenteDao;
import pw.model.Prodotto;
import pw.model.Ordine;
import pw.model.Utente;
import pw.service.OrdineService;
import pw.service.ProdottoService;

@Controller
@RequestMapping("/carrello")
public class CarrelloController {

	@Autowired
	UtenteDao utenteDao;
	
	@Autowired
	OrdineService ordineService;
	
	@Autowired
	ProdottoService prodottoService;
	
	int idUtente;
	
	double totale;
	
	@SuppressWarnings("unchecked")
	@GetMapping
	public String getPage(Model model, HttpSession session, @RequestParam(name = "send", required = false) String send) {
		if (session.getAttribute("username") == null || session.getAttribute("userid") == null) {
			return "redirect:/";
		}
		idUtente = (int) session.getAttribute("userid");
		System.out.println(idUtente);
		List<Prodotto> prodotti = session.getAttribute("carrello") == null ? new ArrayList<>() : (List<Prodotto>) session.getAttribute("carrello");
		totale = prodotti.stream().mapToDouble(Prodotto::getPrezzo).reduce(0.0, (p1, p2) -> p1 + p2);
		model.addAttribute("totale", totale);
		model.addAttribute("title", "Carrello");
		model.addAttribute("prodotti", prodotti);
		model.addAttribute("sent", send != null);
		return "Carrello";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/elimina")
	public String rimuoviProdotto(HttpSession session, @RequestParam ("id") int id) {
		List<Prodotto> carrello = (List<Prodotto>) session.getAttribute("carrello");
		carrello = carrello.stream().filter(p -> p.getId() != id).collect(Collectors.toList());
		session.setAttribute("carrello", carrello);
		return "redirect:/carrello";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/confermaordine")
	public String inviaOrdine(HttpSession session) {
		List<Prodotto> carrello = (List<Prodotto>) session.getAttribute("carrello");
		if (carrello != null && carrello.size() > 0) {
			Ordine ordine = new Ordine();
			ordine.setData(new Date());
			ordine.setTotaleOrdine(totale);
			System.out.println(idUtente);
			Utente utente = utenteDao.findById(idUtente).get();
			ordine.setUtente(utente);
			for (Prodotto p : carrello) {
				Prodotto prodotto = prodottoService.getProdottoById(p.getId());
				ordine.getListaProdotti().add(prodotto);
			}
			ordineService.registraOrdine(ordine);
			carrello.clear();
			session.setAttribute("carrello", carrello);
		}
		return "redirect:/carrello?send";
	}
}
