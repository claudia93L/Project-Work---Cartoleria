package pw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.UtenteDao;
import pw.model.Utente;

@Controller
@RequestMapping("/utenti")
public class UtentiController {

	@Autowired
	private UtenteDao utenteDao;
	
	@GetMapping
	public String getPage(Model model, @RequestParam(name = "id", required = false) Integer id) {
		Utente utente = id == null ? new Utente() : utenteDao.findById(id).get();
		boolean mostraForm = id != null;
		model.addAttribute("mostraForm", mostraForm);
		model.addAttribute("title", "Gestione Clienti");
		model.addAttribute("utente", utente);
		model.addAttribute("utenti", utenteDao.findAll());
		return "area_clienti";
	}
	
	
	
}
