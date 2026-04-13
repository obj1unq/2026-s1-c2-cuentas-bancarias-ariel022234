/* Se van a crear las cuentas*/

object cuentaCorriente {
   var saldo = 0

   method saldo() {
     return saldo
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

    method setCuentaPrimaria(_cuenta) {
      cuentaPrimaria = _cuenta
    }

    method setCuentaSecundaria(_cuenta) {
      cuentaSecundaria = _cuenta
    }

    method depositar(_monto) {
        cuentaPrimaria.depositar(_monto)
    }

    method saldo() {
      return 0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo())
    }

    method extraer(_monto) {
        if (cuentaPrimaria.saldo() <= _monto) {
            cuentaSecundaria.extraer(_monto - cuentaPrimaria.saldo())
            cuentaPrimaria.extraer(cuentaPrimaria.saldo())
            }
        else {
            cuentaPrimaria.extraer(_monto)
        }    
    }

}