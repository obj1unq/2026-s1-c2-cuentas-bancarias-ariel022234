/* Se van a crear las cuentas*/

object cuentaCorriente {
   var saldo = 0
   var pago = false

   method pagoEfectuado() {
     return pago
   }

   method cambioPago(booleano) {
     pago = booleano
   }



   method saldo() {
     return saldo
   }

   method depositar(monto) {
     saldo = saldo + monto 
   }

   method extraer(_cantidad) {
     pago = true
     saldo = saldo - _cantidad
   }
}

object cuentaConGastos {
    var saldo = 0 
    var costoOperacion = 0
    var pago = false

     method pagoEfectuado() {
     return pago
   }

   method cambioPago(booleano) {
     pago = booleano
   }

    method saldo() {
      return saldo
    }

    method depositar(monto) {
        if (monto > costoOperacion) {
            saldo = saldo + monto - costoOperacion
        }
        else {
            saldo = saldo + 0
        }
        
    }

    method setCostoOperacion(_costo) {
      costoOperacion = _costo
    }

    method extraer(_cantidad) {
         pago = true
         saldo = saldo - _cantidad
    }

}

object cuentaCombinada {
    var cuentaPrimaria = null
    var cuentaSecundaria = null
    var pago = false

    /*Consultas */

     method pagoEfectuado() {
     return pago
   }

    method saldo() {
      return 0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo())
    }

    method haySaldoEn(_cuenta) {
      return _cuenta.saldo() > 0
    }

     method saldoCuenta(cuenta) {
       return 0.max(cuenta.saldo())
     }


    /*Acciones  */

      method setCuentaPrimaria(_cuenta) {
      cuentaPrimaria = _cuenta
    }

    method setCuentaSecundaria(_cuenta) {
      cuentaSecundaria = _cuenta
    }

    method depositar(_monto) {
        cuentaPrimaria.depositar(_monto)
    }

    method cambioPago(booleano) {
     pago = booleano
   }

    
    method extraer(_monto) {
       if (self.saldo() >= _monto) {
        self.extraerDeCuentas(_monto)
        pago = true
       }
       else {
        self.error("Sin Saldo" + self.saldo())
       }
    }

    method extraerDeCuentas(_monto) {
      
      if (_monto <= self.saldoCuenta(cuentaPrimaria)) {
        cuentaPrimaria.extraer(_monto)
      }
      else {
        cuentaSecundaria.extraer(_monto - self.saldoCuenta(cuentaPrimaria))
        cuentaPrimaria.extraer(self.saldoCuenta(cuentaPrimaria))
        
      }
      }

}