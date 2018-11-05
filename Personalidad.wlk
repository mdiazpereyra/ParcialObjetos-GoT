import Casa.*

class Personalidad {
	method accionContra(objetivo)
	method puedeRealizarAccionContra(objetivo)
}

object sutil inherits Personalidad {
	
	var posibleConyuge = self.buscarPareja()
	
	override method accionContra(objetivo){
		if(self.puedeRealizarAccionContra(objetivo))
			objetivo.casarse(posibleConyuge)
		else
			self.error("La persona no puede casarse")
	}
	
	override method puedeRealizarAccionContra(objetivo) = objetivo.puedeCasarse(posibleConyuge)
	
	method buscarPareja(){
		return casas.casaMasPobre().miembros().findOrElse({ unMiembro => unMiembro.estaVivo() && unMiembro.estaSoltero() }, { self.error("No hay nadie con quien casarse") })
	}
}

object asesino inherits Personalidad {
	
	override method accionContra(objetivo) { objetivo.morir() }
	
	override method puedeRealizarAccionContra(objetivo) = true
}

object asesinoPrecavido inherits Personalidad {
	
	override method accionContra(objetivo){
		if(self.puedeRealizarAccionContra(objetivo))
			objetivo.morir()
	}
	
	override method puedeRealizarAccionContra(objetivo) = objetivo.estaSolo()
}

class Disipado inherits Personalidad {
	var porcentaje
	
	constructor(unPorcentaje) { porcentaje = unPorcentaje }
	
	override method accionContra(objetivo) { objetivo.derrocharFortuna(porcentaje) }
	
	override method puedeRealizarAccionContra(objetivo) = true
}

object disipado inherits Disipado(30) {}

object miedoso inherits Personalidad {
	
	override method accionContra(objetivo) {}
	
	override method puedeRealizarAccionContra(objetivo) = false
}