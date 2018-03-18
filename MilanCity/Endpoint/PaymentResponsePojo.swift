//
//  UserPojo.swift
//  LogUp
//
//  Created by Antonio Seveso on 17/11/2017.
//  Copyright © 2017 LogUp Inc. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection


class PaymentResponsePojo: NetworkObject {
    
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
    var errore: PaymentErrorPojo?
    var timeStamp: String?
    var mac: String?
    
    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        
    }
    
    override open func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "errore":
            self.errore = PaymentErrorPojo(json: value as! String)
        default:
            NSLog("WARNING: setValue for key '\(key)' should be handled.")
        }
    }
    
    init (fromObj: PaymentResponse) {
        self.esito = fromObj.esito
        self.idOperazione = fromObj.idOperazione
        self.codiceAutorizzazione = fromObj.codiceAutorizzazione
        self.codiceConvenzione = fromObj.codiceConvenzione
        self.data = fromObj.data
        self.ora = fromObj.ora
        self.nazione = fromObj.nazione
        self.regione = fromObj.regione
        self.brand = fromObj.brand
        self.tipoProdotto = fromObj.tipoProdotto
        self.tipoTransazione = fromObj.tipoTransazione
        if let errore = fromObj.errore {
            print(errore)
        }
        self.timeStamp = fromObj.timestamp
    }
    
    func toObj () -> PaymentResponse {
        let paymentResponse = PaymentResponse()
        paymentResponse.esito = esito
        paymentResponse.idOperazione = idOperazione
        paymentResponse.codiceAutorizzazione = codiceAutorizzazione
        paymentResponse.codiceConvenzione = codiceConvenzione
        paymentResponse.data = data
        paymentResponse.ora = ora
        paymentResponse.nazione = nazione
        paymentResponse.regione = regione
        paymentResponse.brand = brand
        paymentResponse.tipoProdotto = tipoProdotto
        paymentResponse.tipoTransazione = tipoTransazione
        paymentResponse.errore = errore?.toObj()
        paymentResponse.timestamp = timeStamp
        
        return paymentResponse
    }
    
}

class PaymentErrorPojo : NetworkObject {
    
    var codice: String?
    var messaggio: String?
    
    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        
    }
    
    init(fromObj: PaymentError) {
        self.codice = fromObj.codice
        self.messaggio = fromObj.messaggio
    }
    
    func toObj() -> PaymentError {
        let paymentError = PaymentError()
        paymentError.codice = codice
        paymentError.messaggio = messaggio
        return paymentError
    }
}
