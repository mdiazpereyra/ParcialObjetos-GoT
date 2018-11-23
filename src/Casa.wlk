import Personaje.*

class Casa {
	var property patrimonio
	var ciudad
	var property miembros
	
	constructor(unPatrimonio, unaCiudad, unosMiembros){
		patrimonio = unPatrimonio
		ciudad = unaCiudad
		miembros = unosMiembros
		casas.agregarCasa(self)
	}
	
	method permiteCasamiento(personaje, conyuge)
	
	method esRica() = patrimonio > 1000
	
	method patrimonioIndividual() = patrimonio / miembros.size()
	
	method perderFortuna(porcentaje){ patrimonio -= patrimonio*porcentaje }	
}

object lannister inherits Casa(1900, "Roca Casterly", [cersei, tyrion, jaime]){
	override method permiteCasamiento(personaje, conyuge) = personaje.estaSoltero()
}

object stark inherits Casa(1200, "Invernalia", [sansa, arya, eddard, hodor]){
	override method permiteCasamiento(personaje, conyuge) = personaje.casa() != conyuge.casa()
}

object guardiaDeLaNoche inherits Casa (400, "El Muro", [jon, aemon]){
	override method permiteCasamiento(personaje, conyuge) = false
}

object casas {
	var property casas = [lannister, stark, guardiaDeLaNoche]
	
	method agregarCasa(unaCasa){ casas.add(unaCasa) }
	
	method casaMasPobre() = casas.min({ unaCasa => unaCasa.patrimonio() })
}
