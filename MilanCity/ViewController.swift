//
//  ViewController.swift
//  MilanCity
//
//  Created by francesco frontino on 17/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Data Source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: self.performSegue(withIdentifier: "ArtEMuseums", sender: self)
        default: print("Not already implemented")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let travellingViewCell = tableView.dequeueReusableCell(withIdentifier: TravellingViewControlleTableViewCell.reusableIdentifier, for: indexPath) as? TravellingViewControlleTableViewCell else {
            return UITableViewCell()
        }
        travellingViewCell.configure(with: indexPath)
        return travellingViewCell
    }
    
    // MARK: - Navigation Bar
    
    /**
     Setup left bar button items
     */
    private func setupLeftBarButtonItems() {}
    
    /**
     Setup custom navigation bar
     */
    private func setupNavigationBar() {
        
        setupNavigationBarTitle()
        setupNavigationBarItems()
    }
    
    /**
     Setup navigation bar items
     */
    private func setupNavigationBarItems() {
        
        setupLeftBarButtonItems()
        setupRightBarButtonItems()
    }
    
    /**
     Setup navigation bar property
     */
    private func setupNavigationBarProperties() {
        
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.elevate(elevation: 0.4)
        definesPresentationContext = true
    }
    
    /**
     Setup navigation bar title
     */
    private func setupNavigationBarTitle() {
        
        let image = #imageLiteral(resourceName: "Risorsa 4")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    /**
     Setup navigation bar right button items
     */
    private func setupRightBarButtonItems() {
        
        var rightBarButtonItems = [UIBarButtonItem]()
        
        let profileButton = UIButton(type: .system)
        profileButton.setTitle("PROFILE", for: .normal)
        profileButton.setTitleColor(UIColor.black, for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        rightBarButtonItems.append(UIBarButtonItem(customView: profileButton))
        navigationItem.rightBarButtonItems = rightBarButtonItems
    }
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.setupNavigationBar()
        UserDefaults.standard.set(nil, forKey: "onClickToken")
        UserDefaults.standard.set(nil, forKey: "scadenza")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}


protocol MaterialView {
    func elevate(elevation: Double)
}

extension UIView: MaterialView {
    
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = abs(CGFloat(elevation))
        self.layer.shadowOpacity = 0.24
    }
}
