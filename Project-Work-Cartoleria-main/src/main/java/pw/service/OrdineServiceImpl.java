package pw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dao.OrdineDao;
import pw.model.Ordine;

@Service
public class OrdineServiceImpl implements OrdineService
{
	@Autowired
	private OrdineDao ordineDao;
	
	@Override
	public void registraOrdine(Ordine ordine) {
		
		ordineDao.save(ordine);
	}

	@Override
	public Ordine getOrdineById(int id) {
		return ordineDao.findById(id).get();
	}

	@Override
	public List<Ordine> getOrdini() {
		return (List<Ordine>) ordineDao.findAll();
	}

	@Override
	public void cancellaOrdine(Ordine ordine) {
		ordine.setUtente(null);
		ordine.setListaProdotti(null);
		ordineDao.save(ordine);
		ordineDao.delete(ordine);
	}
}
