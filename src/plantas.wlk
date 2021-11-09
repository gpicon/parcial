import parcelas.*

class Planta {

	const property anioObtencionSemilla
	var property altura

	method horasSolTolera()

	method esFuerte() = self.horasSolTolera() > 10

	method daNuevasSemillas() = self.esFuerte()

	method espacioPlantada()

	method leResultaIdeal(unaParcela)

}

class Menta inherits Planta {

	override method horasSolTolera() = 6

	override method daNuevasSemillas() {
		return super() or altura > 0.4
	}

	override method espacioPlantada() = altura * 3

	override method leResultaIdeal(unaParcela) = unaParcela.superficie() > 6

}

class Soja inherits Planta {

	override method horasSolTolera() {
		var toleranciaAlSol = 0
		if (altura < 0.5) {
			toleranciaAlSol = 6
		} else if (altura.between(0.5, 1)) {
			toleranciaAlSol = 7
		} else {
			toleranciaAlSol = 9
		}
		return toleranciaAlSol
	}

	override method daNuevasSemillas() {
		return super() or (anioObtencionSemilla > 2007 and altura > 1)
	}

	override method espacioPlantada() = altura / 2

	override method leResultaIdeal(unaParcela) {
		return unaParcela.horasDeSolQueRecibe() == self.horasSolTolera()
	}

}

class Quinoa inherits Planta {

	const horasSolTolera

	override method horasSolTolera() = horasSolTolera

	override method daNuevasSemillas() {
		return super() or anioObtencionSemilla < 2005
	}

	override method espacioPlantada() = 0.5

	override method leResultaIdeal(unaParcela) {
		return unaParcela.plantas().all({ p => p.altura() < 1.5 })
	}

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() = false

	override method leResultaIdeal(unaParcela) {
		return unaParcela.cantidadMaxPlantasQueTolera() == 1
	}

}

class Hierbabuena inherits Menta {

	override method espacioPlantada() = super() * 2

}

