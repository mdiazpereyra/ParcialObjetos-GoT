import Personaje.*

class Conspiracion {
	var property objetivo
	var complotados
	var property objetivoCumplido = false
	
	constructor(unObjetivo, unosComplotados){
		objetivo = unObjetivo
		complotados = unosComplotados
		if(!objetivo.esPeligroso() || objetivo == hodor)
			self.error("No se puede complotar contra esa persona")
	}
	
	method traidores(){
		return complotados.count({ unComplotado => objetivo.aliados().contains(unComplotado) })
	}
	
	method ejecutarConspiracion(){
		if(self.esViable())
			complotados.forEach({ unComplotado => unComplotado.personalidad().accionContra(objetivo) })
			objetivo.sufrirConspiracion()
			objetivoCumplido = true
	}
	
	method esViable() =	complotados.any({ unComplotado => unComplotado.personalidad().puedeRealizarAccionContra(objetivo) })
}
