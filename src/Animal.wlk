import Acompaniante.*

class Animal inherits Acompaniante {
	override method patrimonio() = 0
}

class Lobo inherits Animal {
	const especie
	
	constructor(unaEspecie){ especie = unaEspecie }
	
	override method esPeligroso() = especie == "huargo"
}

object dragon inherits Animal{
	override method esPeligroso() = true
}

// object loboHuargo inherits Lobo("huargo") {}
// object loboArtico inherits Lobo("artico") {}