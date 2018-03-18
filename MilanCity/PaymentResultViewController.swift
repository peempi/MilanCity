//
//  PaymentResultViewController.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class PaymentResultViewController: UIViewController {

    public var result: Bool?
    public var paymentResult: PaymentResponse?
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let result = result, let paymentResult = paymentResult else {
         
            labelResult.text = "Generic error"
            return;
        }
        if result {
            labelResult.text = "Pagamento completato!\nIl tuo id transazione è: \(paymentResult.idOperazione!)"
        } else {
            labelResult.text = "Errore nella transazione: \(paymentResult.errore!.codice!)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
