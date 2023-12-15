package pw.dao;

import org.springframework.data.repository.CrudRepository;

import pw.model.Utente;

public interface UtenteDao extends CrudRepository<Utente, Integer> {}
