package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Jugador;
import com.empresa.service.JugadorService;

@Controller
public class JugadorController {

	@Autowired
	private JugadorService servicio;


	@GetMapping(value = "/verJugador" )
	public String verJugador() {return "registraJugador";}


	//Registra Jugador

	@PostMapping("/registraJugador")
	@ResponseBody
	public Map<?, ?> registra(Jugador obj){
		HashMap<String, String> map = new HashMap<String, String>();
		Jugador objSalida = servicio.insertaJugador(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	

}
