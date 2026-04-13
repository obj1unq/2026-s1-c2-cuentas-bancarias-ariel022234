import cuentas.*


object casa {
    var cuenta = null
    var gastos = 0
    var viveres = 0
    var montoReparacion = 0
    var reparaciones = 0 

    method cuenta() {
      return cuenta
    }

    method nuevoMes() {
      gastos = 0
    }

    method setCuenta(_cuenta) {
      cuenta = _cuenta
    }

    method gastar(cantidad) {
        if(cuenta.saldo() >= cantidad){
            cuenta.extraer(cantidad)
            gastos = gastos + cantidad
        }
        else {
            gastos = gastos + 0
        }
    }

    method gastosTotales() {
      return gastos
    }

    method viveres() {
      return viveres
    }

    method romper(_monto) {
        montoReparacion = montoReparacion + _monto
    }

    method reparar() {
        self.gastar(montoReparacion)
        montoReparacion = 0
    }



}