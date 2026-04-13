import cuentas.*


object casa {
    var cuenta = null
    var gastos = 0

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



}