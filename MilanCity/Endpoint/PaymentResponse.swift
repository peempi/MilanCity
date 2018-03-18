//
//  PaymentResponse.swift
//  MilanCity
//
//  Created by francesco frontino on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation

class PaymentResponse {
    
    var esito: String?
    var idOperazione: String?
    var codiceAutorizzazione: String?
    var codiceConvenzione: String?
    var data: String?
    var ora: String?
    var nazione: String?
    var regione: String?
    var brand: String?
    var tipoProdotto: String?
    var tipoTransazione: String?
    var errore: PaymentError?
    var timestamp: String?
    var mac: String?
    
}

class PaymentError {
    var codice: String?
    var messaggio: String?
}
