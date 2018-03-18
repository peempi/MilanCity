//
//  Payment.swift
//  MilanCity
//
//  Created by francesco frontino on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation
import EVReflection
import Alamofire





class Payment{
    
    var apiKey: String? = nil
    var codiceGruppo: String? = nil
    var codiceTransazione: String? = nil
    var importo: String? = nil //given
    var divisa: String? = nil
    var pan: String? = nil //given
    var scadenza: String? = nil //given
    var cvv: String? = nil //given
    var numeroContratto: String? = nil //given
    var timeStamp: String? = nil
    var mac: String? = nil
    var chiaveSegreta: String?
    

    
    /**
     - parameters:
     - telNumber: number of phone without prefix
     - ISOcode: code of the prefix country for the number
     - langCode: code of the language of the user
     - timeZone: timezone (ex. Europe/Rome)
     */
    init(importo: String, pan: String, scadenza: String, cvv: String) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        let result = formatter.string(from: date)
        
        self.chiaveSegreta = "40AQ57OMPNH1FLC7B8ZGVJ5K90HJXJVM"
        self.apiKey = "ALIAS_MOTO_00004678"
        self.codiceGruppo = "GRP_06249"
        self.codiceTransazione = "TESTPS_" + result

        self.importo = importo
        self.divisa = "978"
        self.pan = pan
        self.scadenza = scadenza
        self.cvv = cvv
        self.numeroContratto = "TEST_" + result
        
        self.timeStamp = String(Int(NSDate().timeIntervalSince1970 * 1000))
        var tempMac: String = "apiKey=" + self.apiKey!
        tempMac = tempMac + "numeroContratto=" + numeroContratto!
        tempMac = tempMac + "codiceTransazione=" + codiceTransazione!
        tempMac = tempMac + "importo=" + self.importo!
        tempMac = tempMac + "divisa=" + self.divisa!
        tempMac = tempMac + "pan=" + self.pan!
        tempMac = tempMac + "cvv=" + self.cvv!
        tempMac = tempMac + "scadenza=" + self.scadenza!
        tempMac = tempMac + "timeStamp=" + self.timeStamp! + self.chiaveSegreta!
        self.mac = tempMac.sha1
    }
    
    
    
    
    public func toParameters() -> Parameters {
        
        return [
            "apiKey" : self.apiKey!,
            "codiceGruppo" : self.codiceGruppo!,
            "codiceTransazione" : self.codiceTransazione!,
            "importo" : self.importo!,
            "divisa" : self.divisa!,
            "pan" : self.pan!,
            "scadenza": self.scadenza!,
            "cvv": self.cvv!,
            "timeStamp": self.timeStamp!,
            "mac" : self.mac!,
            "numeroContratto": self.numeroContratto!
        ]
    }
    
    
    
}



