package pw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.UtenteDao;
import pw.model.Ordine;
import pw.model.Prodotto;
import pw.model.Utente;
import pw.service.OrdineService;
import pw.service.ProdottoService;

@Controller
@RequestMapping("/ordini")
public class OrdiniController {
	@Autowired
	private OrdineService ordineService;
	
	private Ordine ordine;
	
	@Autowired
	private UtenteDao utenteDao;
	
	@Autowired
	private ProdottoService prodottoService;
	
	@GetMapping
	public String getPage(Model model, @RequestParam(name = "id", required = false) Integer id) {
		ordine = id == null ? new Ordine() : ordineService.getOrdineById(id);
		List<Utente> utenti = (List<Utente>) utenteDao.findAll();
		List<Prodotto> prodotti = prodottoService.getProdotto(null);
		if(ordine.getId() != 0)
			for(Prodotto a : prodotti)
				for(Prodotto oa : ordine.getListaProdotti())
					if(a.getId() == oa.getId())
						a.setIncluded(true);
		model.addAttribute("title", "Gestione Ordini");
		boolean mostraForm = id != null;
		model.addAttribute("mostraForm", mostraForm);
		model.addAttribute("ordine", ordine);
		model.addAttribute("ordini", ordineService.getOrdini());
		model.addAttribute("utenti", utenti);
		model.addAttribute("prodotti", prodotti);
		return "area_ordini";
	}
	
	@PostMapping("/registraordine")
	public String registerOrder(@RequestParam("data") String data, @RequestParam("selUtente") int utenteId, @RequestParam(name = "ordineProdotti", required = false) int[] ordineProdotti) {
		if(ordineProdotti == null)
			return "redirect:/ordini";
	//	ordineService.registraOrdine(ordine, data, utenteId, ordineProdotti);
		return "redirect:/ordini";
	}
}