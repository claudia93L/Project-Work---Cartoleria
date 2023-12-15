package pw.dao;

import org.springframework.data.repository.CrudRepository;

import pw.model.Categoria;

public interface CategoriaDao extends CrudRepository<Categoria, Integer> {}
