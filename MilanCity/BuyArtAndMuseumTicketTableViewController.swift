//
//  BuyArtAndMuseumTicketTableViewController.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class BuyArtAndMuseumTicketTableViewController: UIViewController {

    public var artAndMuseum: ArtAndMuseum?
    
    // MARK: - Helper Methods
    
    private func setBackgroundImage(with artAndMusemParam: ArtAndMuseum) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = artAndMusemParam.getImageOpaque()
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
   
    private func getStandarTotal() -> Int {
        guard var text = standardTotal.text else { return 0 }
        text = text.replacingOccurrences(of: "€", with: "")
        text = text.replacingOccurrences(of: " ", with: "")
        let float = Float(text)
        return Int(float!)
    }

    private func getTotal() -> Int {
        guard var text = total.text else { return 0 }
        text = text.replacingOccurrences(of: "€", with: "")
        text = text.replacingOccurrences(of: " ", with: "")
        let float = Float(text)
        return Int(float!)
    }

    private func updateTotal() {
        total.text = "\(getStandarTotal()).00€"
    }
    
    private func setStandarPrice() {
        standarPrice.text = "\(artAndMuseum!.getPriceIntero()).00€"
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let addCreditCardViewController = segue.destination as? AddCreditCardViewController else { print("Ciao coglione 2")
            return
        }
        
        addCreditCardViewController.importo = self.getTotal()
        addCreditCardViewController.quantità = Int(stepper.value)
    }
    
    @IBAction func standardStepper(_ sender: Any) {
        
        let total = Int((sender as! UIStepper).value) * artAndMuseum!.getPriceIntero()
        standardTotal.text = "\(total).00€"
        self.updateTotal()
    }
    
    @IBAction func buy(_ sender: Any) {
        
        if self.getTotal() > 0 {
            self.performSegue(withIdentifier: "AddPaymentCard", sender: self)
        } else {
            print("Select at least one ticket")
        }
    }
    // MARK: - Outlets
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var standardTotal: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var standarPrice: UILabel!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let artAndMuseum = artAndMuseum else { return }
        self.tabBarController?.tabBar.isHidden = true
        self.setBackgroundImage(with: artAndMuseum)
        self.setStandarPrice()
        self.setTitleLabel()
        self.setSubtitleLabel()
        self.setupBuyButton()
    }
    
    private func setupBuyButton() {
        buyButton.layer.borderWidth = 0.8
        buyButton.layer.borderColor = (UIColor.red).cgColor
    }
    
    private func setSubtitleLabel() {
        subtitleLabel.text = artAndMuseum!.getSubtitle()
    }
    
    private func setTitleLabel() {
        titleLabel.text = artAndMuseum!.getTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
