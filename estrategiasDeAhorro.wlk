import casa.*
import cuentas.*


object estrategiaMinEInd {
    var calidad = null

    method costoEstrategia() {
       if (not casa.hayViveresSuficientes()) {
            return (40 - casa.viveres())*calidad
            }
        else {
            return 0
            }
    }

    

    method aplicar() {
        if (not casa.hayViveresSuficientes()) {
            casa.gastar((40 - casa.viveres())*calidad)
            casa.setViveres(40 - casa.viveres())
             }
    }
    method setCalidad(_calidad) {
      calidad = _calidad
    }
}

object estrategiaFull {
  
  method costoEstrategia() {
       if(casa.casaEnOrden()) {
        return (100 - casa.viveres())*5
    }
    else {
        return (40 - casa.viveres())*5
       
    }
    }


  method aplicar() {
    if(casa.casaEnOrden()) {
        self.comprarViveres()
    }
    else {
        
        self.comprarPocosViveres()
        self.reparaciones()
       
    }

  }

  method reparaciones() {
        casa.gastar(casa.montoReparacion())
        casa.setReparaciones(0)

  }

  method puedoReparar() {
    return casa.cuenta().saldo() >= casa.montoReparacion() && casa.hayQueHacerReparaciones()
  }

  method comprarPocosViveres() {
    if (not casa.hayViveresSuficientes()) {
        casa.gastar((40 - casa.viveres())*5)
    }
  }


  method comprarViveres() {
    if (casa.viveres() < 100) {
        casa.gastar((100 - casa.viveres())*5)
        casa.setViveres(100 - casa.viveres())
    }
    
  }
}

