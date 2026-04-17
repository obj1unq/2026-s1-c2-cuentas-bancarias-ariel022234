/* Se van a crear las cuentas*/

object cuentaCorriente {
   var saldo = 0

   method saldo() {
     return saldo
   }

   method puedePagar(monto) {
     return true
   }

   method depositar(monto) {
     saldo = saldo + monto 
   }

   method extraer(_cantidad) {
     saldo = saldo - _cantidad
   }
}

object cuentaConGastos {
    var saldo = 0 
    var costoOperacion = 0


    method saldo() {
      return saldo
    }

    method puedePagar(monto) {
      return true
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
         saldo = saldo - _cantidad
    }

}

object cuentaCombinada {
    var cuentaPrimaria = null
    var cuentaSecundaria = null

    /*Consultas */

    method saldo() {
      return 0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo())
    }

    method haySaldoEn(_cuenta) {
      return _cuenta.saldo() > 0
    }

     method saldoCuenta(cuenta) {
       return 0.max(cuenta.saldo())
     }

     method puedePagar(monto) {
        return self.saldo() >= monto
     }


    /*Acciones  */

      method setCuenta(primaria,secundaria) {
      cuentaPrimaria = primaria
      cuentaSecundaria = secundaria
    }

    method depositar(_monto) {
        cuentaPrimaria.depositar(_monto)
    }
    
    method validarExtraccion(_monto) {
       if (self.saldo() < _monto) {
        self.error("Sin Saldo" + self.saldo())
       }
    }

    method extraer(_monto) {
      self.validarExtraccion(_monto)
      
      if (_monto <= self.saldoCuenta(cuentaPrimaria)) {
        cuentaPrimaria.extraer(_monto)
      }
      else {
        cuentaSecundaria.extraer(_monto - self.saldoCuenta(cuentaPrimaria))
        cuentaPrimaria.extraer(self.saldoCuenta(cuentaPrimaria))
        
      }
      }

}