import Personaje.*

class Complotado inherits Personaje{
	const property personalidad
	
	constructor(unaCasa, unosConyuges, unosAcompaniantes, unaPersonalidad) = super(unaCasa, unosConyuges, unosAcompaniantes){
		personalidad = unaPersonalidad
	}
}
