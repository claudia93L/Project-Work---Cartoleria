package pw.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pw.dao.CategoriaDao;
import pw.dao.ProdottoDao;
import pw.model.Categoria;
import pw.model.Prodotto;

@Controller
@RequestMapping("/prodotti")
public class ProdottiController {
	
	@Autowired
	private ProdottoDao prodottoDao;
	
	@Autowired
	private CategoriaDao categoriaDao;
	
	@GetMapping
	public String getPage(Model model, @RequestParam(name = "id", required = false) Integer id, @RequestParam(name = "fn", required = false) String fileName) {
		Prodotto prodotto = id == null ? new Prodotto() : prodottoDao.findById(id).get();
		model.addAttribute("title", "Gestione Prodotti");
		model.addAttribute("prodotto", prodotto);
		model.addAttribute("prodotti", prodottoDao.findAll());
//		boolean mostraForm = id != null;
//		model.addAttribute("mostraForm", mostraForm);
		model.addAttribute("categorie", categoriaDao.findAll());
		model.addAttribute("showForm", fileName);
		return "area_prodotti_e_categorie";
	}
	
	@PostMapping("/registra")
	public String registraProdotto(@RequestParam("id") int id, @RequestParam("nomeProdotto") String nomeProdotto, @RequestParam("descrizione") String descrizione, @RequestParam("quantita") String quantita, @RequestParam("prezzo") String prezzo, @RequestParam("codiceProdotto") String codiceProdotto, @RequestParam("categoria") String idCategoria) {
		Categoria categoria = categoriaDao.findById(Integer.parseInt(idCategoria)).get();
		Prodotto prodotto = id == 0 ? new Prodotto() : prodottoDao.findById(id).get();
		prodotto.setNomeProdotto(nomeProdotto);
		prodotto.setDescrizione(descrizione);
		prodotto.setQuantita(Integer.parseInt(quantita));
		prodotto.setPrezzo(Double.parseDouble(prezzo));
		prodotto.setCodiceProdotto(codiceProdotto);
		prodotto.setCategoriaProdotto(categoria);
		prodottoDao.save(prodotto);
		String fileName;
		if (id == 0)
			fileName = String.valueOf(prodottoDao.getMaxProductId());
		else {
			fileName = String.valueOf(id);
		}
		
//	    if(prodotto.getId() != 0)
//		{
//			Categoria categoria = categoriaDao.findById(prodotto.getId()).get();
//			prodotto.setNomeProdotto(prodotto.getNomeProdotto());
//			prodotto.setDescrizione(prodotto.getDescrizione());
//			prodotto.setQuantita(prodotto.getQuantita());
//			prodotto.setPrezzo(prodotto.getPrezzo());
//			prodotto.setCodiceProdotto(prodotto.getCodiceProdotto());
//			categoria.setDescrizione(prodotto.getCategoriaProdotto().getDescrizione());
//			prodotto.setCategoriaProdotto(categoria);
//		}
//		prodottoDao.save(prodotto);
		return "redirect:/prodotti?fn=" + fileName + "&id=" + fileName;
	}
	
	@PostMapping("/immagine")
	public String caricaImmagine(@RequestParam("fileName") String fileName, @RequestParam("image") MultipartFile image, HttpSession session) {
		if (image != null && !image.isEmpty()) {
			String rootDir = session.getServletContext().getRealPath("/");
			String filePath = rootDir + "static\\prodotti\\" + fileName + ".png";
			try {
				image.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace(); 
			}
		}
		return "redirect:/prodotti";
			
	}

}
