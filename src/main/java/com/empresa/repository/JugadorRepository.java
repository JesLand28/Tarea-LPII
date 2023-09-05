package com.empresa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empresa.entity.Jugador;

public interface JugadorRepository extends JpaRepository<Jugador, Integer> {
	
		
}
