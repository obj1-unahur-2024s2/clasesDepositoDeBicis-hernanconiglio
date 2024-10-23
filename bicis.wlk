class Bici {
    var property rodado
    const property largo
    const property marca
    const property accesorios = []

    method altura() = rodado * 2.5 + 15
    method velocidad() {
        return if(largo > 120) rodado + 6 else rodado + 2
    }
    method carga() {
        return accesorios.sum({a=>a.carga()})
    }

    method peso() {
        return rodado / 2 + accesorios.sum({a=>a.peso()})
    }

    method tieneLuz() {
        return accesorios.any({a=>a.esLuminoso()})
    }

    method cantAccesoriosLivianos() {
        return accesorios.count({
            a=>a.peso() < 1
        })
    }

    method esCompaDe(otraBici) {
        return otraBici.marca() == self.marca()
        and (otraBici.largo() - self.largo()).abs() <= 10
        and otraBici != self
    }
}

class Farolito {
    method peso() = 0.5
    method carga() = 0
    method esLuminoso() = true
}

class Canasto {
    const volumen
    method peso() = volumen / 10
    method carga() = volumen * 2
    method esLuminoso() = false
}

class Morral {
    const largo
    var property tieneOjoDeGato
    method peso() = 1.2
    method carga() = largo / 3
    method esLuminoso() = tieneOjoDeGato
}

class Deposito {
    const bicis = []

    method bicisRapidas() {
        return bicis.filter{
            b=>b.velocidad() > 25}
    }

    method marcasDeBicis() {
        return bicis.map{
            b=>b.marca()}.asSet()
    }

    method esNocturno() {
        return bicis.all{
            b=>b.tieneLuz()
        }
    }

    method tieneBiciParaCargar(kg) {
        return bicis.any{
            b=>b.carga() > kg
        }
    }

    method laMarcaMasRapida() {
        return self.biciMasRapida().marca()
    }

    method biciMasRapida() {
        return bicis.max{
            b=>b.velocidad()
        }
    }

    method bicisLargas() {
        return bicis.filter{
            b=>b.largo() > 170
        }
    }

    method cargaTotalBicisLargas() {
        if(!self.bicisLargas().isEmpty()) {
            return self.bicisLargas().sum{
                b=>b.carga()
            }
        }
        else return 0
    }

    method bicisSinAccesorios() {
        return bicis.count{
            b=>b.accesorios().isEmpty()
        }
    }

    method bicisCompasDe(unaBici) {
        return bicis.filter{
            b=>b.esCompaDe(unaBici)
        }
    }


}