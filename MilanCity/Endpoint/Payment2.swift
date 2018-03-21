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


class Payment2{
    
    var apiKey: String? = nil
    var codiceGruppo: String? = nil
    var codiceTransazione: String? = nil
    var importo: String? = nil //given
    var divisa: String? = nil
    var scadenza: String? = nil //given
    var numeroContratto: String? = nil //given
    var timeStamp: String? = nil
    var mac: String? = nil
    var chiaveSegreta: String?
    
    
    
   
    init(importo: String, scadenza: String, numeroContratto: String) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        let result = formatter.string(from: date)
        
        self.chiaveSegreta = "FOAJVEQE01O5HMJ8ONQKHK6DDRC63NBJ"
        self.apiKey = "ALIAS_MOTO_00004679"
        self.codiceGruppo = "GRP_06249"
        self.codiceTransazione = "TESTPS_" + result
        
        self.importo = importo
        self.divisa = "978"
        self.scadenza = scadenza
        self.numeroContratto = numeroContratto
        
        self.timeStamp = String(Int(NSDate().timeIntervalSince1970 * 1000))
        var tempMac: String = "apiKey=" + self.apiKey!
        tempMac = tempMac + "numeroContratto=" + self.numeroContratto!
        tempMac = tempMac + "codiceTransazione=" + codiceTransazione!
        tempMac = tempMac + "importo=" + self.importo!
        tempMac = tempMac + "divisa=" + self.divisa!
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
            "scadenza": self.scadenza!,
            "timeStamp": self.timeStamp!,
            "mac" : self.mac!,
            "numeroContratto": self.numeroContratto!
        ]
    }
    
    
    
}




