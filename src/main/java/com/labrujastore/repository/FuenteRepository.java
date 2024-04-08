package com.labrujastore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.labrujastore.entity.Fuente;

@Repository
public interface FuenteRepository extends JpaRepository<Fuente, Integer>{

}
