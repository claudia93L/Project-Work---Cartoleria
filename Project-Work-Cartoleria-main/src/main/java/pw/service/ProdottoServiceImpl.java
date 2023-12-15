package pw.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dao.ProdottoDao;
import pw.model.Prodotto;

@Service
public class ProdottoServiceImpl implements ProdottoService {

	@Autowired
	private ProdottoDao prodottoDao;
	
	@Override
	public Prodotto getProdottoById(int id) {
		return prodottoDao.findById(id).get();
	}

	@Override
	public void cancellaProdotto(Prodotto prodotto) {
		prodotto.setCategoriaProdotto(null);
		prodottoDao.save(prodotto);
		prodottoDao.delete(prodotto);
	}
	
	@Override
	public void registraProdotto(Prodotto prodotto) {
		prodottoDao.save(prodotto);
	}
	
	@Override
	public List<Prodotto> getProdotto(String categoria) {
		List<Prodotto> prodotti = (List<Prodotto>) prodottoDao.findAll();
		if (categoria != null) {
			switch(categoria) {
				case "cancelleria":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 1).collect(Collectors.toList());
					break;
				case "carta":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 2).collect(Collectors.toList());
					break;
				case "zaini":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 3).collect(Collectors.toList());
					break;
				case "bellearti":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 4).collect(Collectors.toList());
					break;
				case "penne":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 5).collect(Collectors.toList());
					break;
				case "informatica":
					prodotti = prodotti.stream().filter(p -> p.getCategoriaProdotto().getId() == 6).collect(Collectors.toList());
					break;
			}
		}
		return prodotti;
	}

}
