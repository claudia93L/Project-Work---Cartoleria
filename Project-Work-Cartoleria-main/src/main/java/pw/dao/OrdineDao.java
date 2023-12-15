package pw.dao;

import org.springframework.data.repository.CrudRepository;

import pw.model.Ordine;

public interface OrdineDao extends CrudRepository<Ordine, Integer> {}
