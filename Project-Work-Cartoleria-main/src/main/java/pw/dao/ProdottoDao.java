package pw.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import pw.model.Prodotto;

public interface ProdottoDao extends CrudRepository<Prodotto, Integer> {
	
	@Query(value = "SELECT MAX(id) FROM prodotti", nativeQuery = true)
	int getMaxProductId();
	
}
