class ChevroletCorsa {
    var property color

    method capacidad() = 4
    method velocidadMaxima() = 150
    method peso() = 1300
}
class RenaultKwid{
    var tieneTanque

    method ponerTanque() {tieneTanque = true}
    method quitarTanque() {tieneTanque = false}
    method tieneTanque() = tieneTanque
    method capacidad() = if(!tieneTanque) 4 else 3
    method velocidadMaxima() = if(tieneTanque) 120 else 110
    method peso() = 1200 + if(tieneTanque) 150 else 0
    method color() = 'Azul'
}

object trafic{
    var property interior = comodo
    var property motor = pulenta

    method capacidad() = interior.capacidad()
    method velocidadMaxima() = motor.velocidadMaxima()
    method peso() = 4000 + interior.peso() + motor.peso()
    method color() = 'Blanco'

}
class AutoEspecial{
    const property capacidad
    const property velocidadMaxima
    const property peso 
    const property color
}
//Interiores
object comodo{
    method capacidad() = 5
    method peso() = 700
}
object popular {
    method capacidad() = 12
    method peso() = 1000
}
//Motores
object pulenta{
    method velocidadMaxima() = 130
    method peso() = 800
}
object bataton {
    method velocidadMaxima() = 80
    method peso() = 500
}
