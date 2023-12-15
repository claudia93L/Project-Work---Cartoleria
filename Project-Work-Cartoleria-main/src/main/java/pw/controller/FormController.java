package pw.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pw.dao.UtenteDao;
import pw.model.Utente;

@Controller
@RequestMapping("/registrazione")
public class FormController {

	@Autowired
	private UtenteDao utenteDao;
	
	@GetMapping
	public String getPage(Model model) {
		model.addAttribute("title", "Form Registrazione");
		model.addAttribute("utente", new Utente());
		model.addAttribute("utenti", utenteDao.findAll());
		return "Form";
	}
	
	@PostMapping
	public String registraUtente(@Valid @ModelAttribute("utente") Utente utente, BindingResult result) {
		if (result.hasErrors())
			return "Form";
		utenteDao.save(utente);
		return "redirect:/registrazionesuccesso";
	}
	
}
