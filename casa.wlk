import cuentas.*


object casa {
    var cuenta = null
    var gastos = 0
    var viveres = 0
    var montoReparacion = 0
    var reparaciones = 0 
   
   
    /* Gestion de cuenta  */
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

    /*Gestion viveres*/

    method viveres() {
      return viveres
    }

    method setViveres(porcentaje) {
      viveres = porcentaje
    }

    method puedeComprarViveres(porcentaje) {
      return porcentaje + viveres <= 100
    }

    method comprarViveres(porcentaje,calidad) {
      if (self.puedeComprarViveres(porcentaje)) {
            self.gastar(porcentaje*calidad)
            viveres = viveres + porcentaje
      }
      else {
        self.error("Sin saldo en cuenta" + cuenta.saldo())
      }
    }

    method hayViveresSuficientes() {
      return viveres >= 40 
    }

    /*Gestion reparaciones */

    method romper(_monto) {
        montoReparacion = montoReparacion + _monto
        reparaciones = reparaciones + 1
    }

    method reparaciones() {
      return reparaciones
    }

    method montoReparacion() {
      return montoReparacion
    }

    method reparar() {
        self.gastar(montoReparacion)
        montoReparacion = 0
        reparaciones = 0
    }

    method hayQueHacerReparaciones() {
      return reparaciones > 0 
    }

    /* Orden casa */ 

    method casaEnOrden() {
      return not self.hayQueHacerReparaciones() && self.hayViveresSuficientes()
    }



}