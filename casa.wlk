import cuentas.*


object casa {
    var cuenta = null
    var gastos = 0
    var viveres = 0
    var montoReparacion = 0
    var reparaciones = 0 
    var estrategia = null
   
   
    /* Gestion de cuenta  */
    method setEstrategia(_estrategia) {
      estrategia = _estrategia
    }

    method cuenta() {
      return cuenta
    }

    method nuevoMes() {
      if (cuenta.puedePagar(estrategia.costoEstrategia())) {
        self.mantenimiento()
        gastos = 0
      }
      else {
        gastos = 0
      }
    }

    method mantenimiento() {
          estrategia.aplicar()
    }

    method setCuenta(_cuenta) {
      cuenta = _cuenta
    }



    method gastar(cantidad) {
        cuenta.extraer(cantidad)
        gastos = gastos + cantidad
    }


    method gastosTotales() {
      return gastos
    }

    /*Gestion viveres*/

    method viveres() {
      return viveres
    }

    method setViveres(porcentaje) {
      if (100 < viveres + porcentaje) {
        self.error("La casa esta llena de viveres" + self.viveres())
      }
      else {
        viveres = viveres + porcentaje
      }
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
        self.error("Viveres supera el maximo:" + self.viveres())
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

    method setReparaciones(cant) {
      reparaciones = cant
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