//
//  Payment.swift
//  MilanCity
//
//  Created by francesco frontino on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class PaymentEndpoint: Endpoint {
    
    var scadenza: String? = nil //given
    var numeroContratto: String? = nil //given
    
    override init() {
        super.init()
    }
    
    func createFirstPayment(_ payment: Payment, _ onResponse: @escaping (_ paymentResponse: PaymentResponse?, _ error: Error?) -> Void) {
        
        let endpointPath = "https://int-ecommerce.nexi.it/ecomm/api/recurring/primoPagamentoSSL"
        print(payment.toParameters())
        Alamofire.request(endpointPath, method: .post, parameters: payment.toParameters(), encoding: JSONEncoding.default, headers: nil).responseString { response in
            
            switch response.result {
            case .success:
                self.numeroContratto = payment.numeroContratto
                self.scadenza = payment.scadenza
                let json = response.result.value!
                print(json)
                let paymentResponsePojo = PaymentResponsePojo(json: json)
                onResponse(paymentResponsePojo.toObj(), nil)
            case .failure(let error):
                print("Failure error \(error)")
                onResponse(nil, nil)
            }
        }
    }
    
    func createOneClickPayment(_ payment: Payment2, _ onResponse: @escaping (_ paymentResponse: PaymentResponse?, _ error: Error?) -> Void) {
        
        let endpointPath = "https://int-ecommerce.nexi.it/ecomm/api/recurring/pagamentoRicorrente"
        print(payment.toParameters())
        Alamofire.request(endpointPath, method: .post, parameters: payment.toParameters(), encoding: JSONEncoding.default, headers: nil).responseString { response in
            
            switch response.result {
            case .success:
                let json = response.result.value!
                print(json)
                let paymentResponsePojo = PaymentResponsePojo(json: json)
                onResponse(paymentResponsePojo.toObj(), nil)
            case .failure(let error):
                print("Failure error \(error)")
                onResponse(nil, nil)
            }
        }
    }
    
    
}

