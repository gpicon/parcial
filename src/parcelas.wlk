import plantas.*

class Parcela {

	const property ancho
	const property largo
	const property horasDeSolQueRecibe
	const property plantas = #{}

	method superficie() = ancho * largo

	method cantidadMaxPlantasQueTolera() = if (ancho > largo) {
		self.superficie() / 5
	} else {
		self.superficie() / 3 + largo
	}

	method tieneComplicaciones() {
		return plantas.any({ planta => planta.horasSolTolera() < horasDeSolQueRecibe })
	}

	method aceptaUnaPlantaMas() = 1 + plantas.size() <= self.cantidadMaxPlantasQueTolera()

	method plantar(unaPlanta) {
		if (not self.aceptaUnaPlantaMas() or not (horasDeSolQueRecibe - unaPlanta.horasSolTolera() < 2)) {
			self.error("No están dadas las condiciones para plantar")
		} else {
			plantas.add(unaPlanta)
		}
	}

	method seAsociaBien(unaPlanta)

	method porcentajePlantasBienAsociadas() {
		return 100 * (plantas.count({ p => self.seAsociaBien(p) }) / plantas.size())
	}

}

class Ecologica inherits Parcela {

	override method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.leResultaIdeal(self)

}

class Industrial inherits Parcela {

	override method seAsociaBien(unaPlanta) = plantas.size() <= 2 and unaPlanta.esFuerte()

}

