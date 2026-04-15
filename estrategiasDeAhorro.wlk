import casa.*
import cuentas.*


object estrategiaMinEInd {
    var calidad = null 


    method aplicar() {
        if (not casa.hayViveresSuficientes()) {
            //Logica de comprar viveres
            //Para alcanzar los 40%, restar 40 - casa.viveres() 
        }
        else {
            //No hace nada y queda todo como esta 
        }
    }
    method setCalidad(_calidad) {
      calidad = _calidad
    }
}

object estrategiaFull {
  method aplicar() {
    if(casa.casaEnOrden()) {
            //Logica de compra
            /* Para llevar los viveres al cien hacer un metodo con la logica de si (casa.viveres() < 100)
            entonces se le resta a 100 la cantidad de viveres y eso es lo que hay que comprar
            para llegar a 100 sino, si es >= no hace nada y queda todo como esta. 
            */
    }
    else {
        // Logica en caso contrario
        // mehtod que maneje de comprar viveres si estan a menos de 40
        // method para hacer reparaciones si hay para hacer alguna y si hay saldo en cuenta
    }
  }
}