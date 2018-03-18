//
//  AddCreditCardViewController.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class AddCreditCardViewController: UIViewController {

    private var paymentResult: Bool = false
    private var paymentResponse: PaymentResponse?
    public var importo: Int?
    public var quantità: Int?
    
    // MARK: - Helper Methods
    
    private func getImporto() -> String {
        if let importo = importo {
            return "\(importo * 100)"
        } else {
            return "0";
        }
    }
    
    private func getQuantità() -> Int {
        if let quantità = quantità {
            return quantità
        } else {
            return 0
        }
    }
    
    private func getPan() -> String {
        return panTextField.text!
    }
    
    private func getCvv() -> String {
        return cvvTextField.text!
    }
    
    private func getScadenza() -> String {
        return expirationYearTextField.text! + expirationMonthTextField.text!
    }
    
    private func setupConfirmButton() {
        confirmButton.layer.borderWidth = 0.8
        confirmButton.layer.borderColor = (UIColor.red).cgColor
    }
    
    private func setupCreditCardView() {
        if let _ = UserDefaults.standard.string(forKey: "onClickToken"), let _ = UserDefaults.standard.string(forKey: "scadenza") {
            self.creditCardView.isHidden = true
        }
    }
    
    private func setupDetailsLabel() {
        detailsLabel.text = "\(self.getQuantità())\nSTANDARD PACKETS\n18.03.2018\n16:30"
    }
    
    private func setupTotalLabel() {
        totalLabel.text = "\(importo!).00 €"
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let paymentResultViewController = segue.destination as? PaymentResultViewController else {
            print("Errore coglione")
            return
        }
        paymentResultViewController.result = self.paymentResult
        paymentResultViewController.paymentResult = self.paymentResponse
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var expirationYearTextField: UITextField!
    @IBOutlet weak var expirationMonthTextField: UITextField!
    @IBOutlet weak var panTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var creditCardView: UIView!
    // MARK: - Selectors
    
    @IBAction func confirm(_ sender: Any) {
        
        let endpointPayment = PaymentEndpoint()
        
        if let onClickToken = UserDefaults.standard.string(forKey: "onClickToken"), let scadenza = UserDefaults.standard.string(forKey: "scadenza") {
            let payment = Payment2(importo: self.getImporto(), scadenza: scadenza, numeroContratto: onClickToken)
            
            endpointPayment.createOneClickPayment(payment) { (paymentResponse, error) in
                
                if let paymentResponse = paymentResponse {
                    self.paymentResponse = paymentResponse
                    if let esito = paymentResponse.esito, esito == "OK" {
                        self.paymentResult = true
                    }
                }
                self.performSegue(withIdentifier: "PaymentResponse", sender: self)
            }
        } else {
            let payment = Payment(importo: self.getImporto(), pan: self.getPan(), scadenza: self.getScadenza(), cvv: self.getCvv())
            
            endpointPayment.createFirstPayment(payment) { (paymentResponse, error) in
                
                if let paymentResponse = paymentResponse {
                    self.paymentResponse = paymentResponse
                    if let esito = paymentResponse.esito, esito == "OK" {
                        self.paymentResult = true
                        UserDefaults.standard.set(payment.numeroContratto, forKey: "onClickToken")
                        UserDefaults.standard.set(payment.scadenza, forKey: "scadenza")
                    }
                }
                self.performSegue(withIdentifier: "PaymentResponse", sender: self)
            }
        }
    }
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConfirmButton()
        self.setupDetailsLabel()
        self.setupTotalLabel()
        self.setupCreditCardView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
