import rodados.*

class Dependencia{
    const property flota = #{}
    var property empleados
    const property pedidos = #{}

    method agregarAFlota(rodado) = flota.add(rodado)
    method quitarDeFlota(rodado) = flota.remove(rodado)
    method pesoTotalFlota() = flota.sum({r=>r.peso()})
    method estaBienEquipada() = flota.size() >= 3 && flota.all({r=>r.velocidadMaxima() >= 100})
    method capacidadTotalEnColor(color) = flota.filter({r=>r.color() == color}).sum({r=>r.capacidad()})
    method colorDelRodadoMasRapido() = flota.max({r=>r.velocidadMaxima()}).color()
    method capacidadFaltante() = empleados - self.capacidadTotal()
    method capacidadTotal() = flota.sum({r=>r.capacidad()})
    method esGrande() = empleados >= 40 && flota.size() >= 5

    method agregarPedido(pedido) = pedidos.add(pedido)
    method quitarPedido(pedido) = pedidos.remove(pedido)
    method totalPasajerosRegistrados() = pedidos.sum({p=>p.cantidadDePasajeros()})
  //  method cualesPedidosNoSonSatisfechos() = Pensar como hacerlo
    method todosLosPedidosSonIncompatibles(color) = pedidos.all({p=>p.esColorIncompatible(color)})
    method relajarATodos() {pedidos.foreach({p=>p.relajar()})}
}

class Pedidos{
    const property distancia
    var tiempoMaximo
    const property cantidadDePasajeros
    const property coloresIncompatibles

    method tiempoMaximo() = tiempoMaximo
    method velocidadRequerida() = distancia / tiempoMaximo
    method satisfaceElPedido(auto) = auto.velocidadMaxima() >= self.velocidadRequerida() &&
                                        auto.capacidad() >= cantidadDePasajeros &&
                                        !coloresIncompatibles.contains(auto.color())
    method acelerar() {tiempoMaximo -= 1}
    method relajar() {tiempoMaximo += 1}
    method esColorIncompatible(color) = coloresIncompatibles.contains(color)
}