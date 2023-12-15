package pw.dao;

import org.springframework.data.repository.CrudRepository;

import pw.model.Admin;

public interface AdminDao extends CrudRepository<Admin, Integer> {	}
