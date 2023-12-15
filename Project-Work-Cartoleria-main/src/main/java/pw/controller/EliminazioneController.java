package pw.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pw.dao.UtenteDao;
import pw.helper.EliminaOggetto;
import pw.model.Ordine;
import pw.model.Prodotto;
import pw.model.Utente;
import pw.service.OrdineService;
import pw.service.ProdottoService;

@Controller
@RequestMapping("/confermaeliminazione")
public class EliminazioneController
{
	@Autowired
	private ProdottoService prodottoService;
	
	@Autowired
	private UtenteDao utenteDao;
	
	@Autowired
	private OrdineService ordineService;
	
	private EliminaOggetto eliminaOggetto;
	
	@GetMapping
	public String getPage(Model model, @RequestParam("id") int id, @RequestParam("type") String tipo) {
		setOggettoEliminabile(id, tipo);
		model.addAttribute("title", "Conferma Eliminazione");
		model.addAttribute("elimina", eliminaOggetto);
		return "Eliminazione";
	}
	
	private void setOggettoEliminabile(int id, String tipo) {
		switch(tipo)
		{
			case "prodotto":
				Prodotto prodotto = prodottoService.getProdottoById(id);
				eliminaOggetto = new EliminaOggetto(id, tipo, prodotto.getDescrizione(), "/prodotti");
				break;
			case "utente":
				Utente utente = utenteDao.findById(id).get();
				eliminaOggetto = new EliminaOggetto(id, tipo, utente.getCognome(), "/utenti");
				break;
			case "ordine":
				Ordine ordine = ordineService.getOrdineById(id);
				eliminaOggetto = new EliminaOggetto(id, tipo, ordine.getId() + " - " + ordine.getUtente().getProfilo(), "/ordini");
		}
	}
	
	@GetMapping("/eliminaoggetto")
	public String eliminazioneOggetto(HttpSession session) {
		switch(eliminaOggetto.getType()) {
			case "prodotto":
				Prodotto prodotto = prodottoService.getProdottoById(eliminaOggetto.getId());
				prodottoService.cancellaProdotto(prodotto);
				String rootDir = session.getServletContext().getRealPath("/");
				String filePath = rootDir + "static\\image\\" + prodotto.getId() + ".png";
				File file = new File(filePath);
				file.delete();
				break;
			case "utente":
				utenteDao.delete(utenteDao.findById(eliminaOggetto.getId()).get());
				break;
			case "ordine":
				ordineService.cancellaOrdine(ordineService.getOrdineById(eliminaOggetto.getId()));
		}
		return "redirect:" + eliminaOggetto.getRedirect();
	}
}
