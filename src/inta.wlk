import plantas.*
import parcelas.*

object inta {

	const property parcelas = #{}

	method promedioPlantasPorParcela() {
		return self.totalPlantasEnParcelas() / self.parcelas().size()
	}

	method totalPlantasEnParcelas() {
		return self.parcelas().sum({ p => p.plantas().size() })
	}

	method parcelaMasAutosustentable() {
		return self.parcelas().filter({ p => p.plantas().size() > 4 }).max({ p => p.porcentajePlantasBienAsociadas() })
	}

}

