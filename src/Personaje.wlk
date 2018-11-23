import Casa.*
import Acompaniante.*

class Personaje inherits Acompaniante {
	const property casa
	var property conyuges
	var property acompaniantes
	var property estaVivo = true
	var property fueObjetivo = false
	
	constructor(unaCasa, unosConyuges, unosAcompaniantes) {
		casa = unaCasa
		conyuges = unosConyuges
		acompaniantes = unosAcompaniantes
	}
	
	method puedeCasarse(conyuge) = casa.permiteCasamiento(self, conyuge)
	
	method casarse(conyuge){
		if( self.puedeCasarse(conyuge) && conyuge.puedeCasarse(self) ){
			self.agregarConyuge(conyuge)
			conyuge.agregarConyuge(self)
		}
		else
			self.error("No pueden casarse")
	}
	
	method agregarConyuge(nuevoConyuge) { conyuges.add(nuevoConyuge) }
	
	override method patrimonio() { casa.patrimonioIndividual() }
	
	method morir() { estaVivo = false }
	
	method estaSolo() { acompaniantes.isEmpty() }
	
	method estaSoltero() { conyuges.isEmpty() }
	
	method aliados() = conyuges + acompaniantes + casa.miembros()
	
	override method esPeligroso(){
		if(estaVivo && !fueObjetivo){
			if(self.todosSusAliadosSuman10000MonedasDeOro())
				return true
			else if(self.todosSusConyugesSonDeCasaRica())
				return true
			else
				return self.seAlioConAlguienPeligroso()
		}
		else
			return false
	}
	
	method todosSusAliadosSuman10000MonedasDeOro() = self.aliados().sum({ unAliado => unAliado.patrimonio() }) > 10000
	
	method todosSusConyugesSonDeCasaRica() = conyuges.all({ unConyuge => unConyuge.casa().esRica() })
	
	method seAlioConAlguienPeligroso() = self.aliados().any({ unAliado => unAliado.esPeligroso() })
	
	method derrocharFortuna(porcentaje) { casa.perderFortuna(porcentaje) }
	
	method sufrirConspiracion() { fueObjetivo = true }
}

object cersei inherits Personaje(lannister, [], []) {}

object tyrion inherits Personaje(lannister, [], []) {}

object jaime inherits Personaje(lannister, [], []) {}

object sansa inherits Personaje(stark, [], []) {}

object arya inherits Personaje(stark, [], []) {}

object eddard inherits Personaje(stark, [], []) {}

object hodor inherits Personaje(stark, [], []) {}

object jon inherits Personaje(guardiaDeLaNoche, [], []) {}

object aemon inherits Personaje(guardiaDeLaNoche, [], []) {}