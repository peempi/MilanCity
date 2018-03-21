//
//  ArtEMuseumTableViewController.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class ArtEMuseumTableViewController: UITableViewController {

    private var selectedArtAndMuseum: ArtAndMuseum?
    let dataSource = ArtAndMuseumDataSource(artAndMuseums: ArtAndMuseumSource.artAndMuseums)
    
    // MARK:- Navigation Bar
    
    /**
     Setup left bar button items inside the navigation bar
     */
    private func setupLeftBarButtonItems() {
        
        var leftBarButtonItems = [UIBarButtonItem]()
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "ic_keyboard_arrow_left").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: #imageLiteral(resourceName: "ic_keyboard_arrow_left").size.width, height: #imageLiteral(resourceName: "ic_keyboard_arrow_left").size.height)
        leftBarButtonItems.append(UIBarButtonItem(customView: backButton))
        
        navigationItem.leftBarButtonItems = leftBarButtonItems
    }
    
    /**
     Setup navigation bar
     */
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: true)
        setupNavigationBarProperties()
        setupNavigationBarItems()
        setupNavigationBarTitle()
    }
    
    /**
     Setup navigation bar items
     */
    private func setupNavigationBarItems() {
        setupLeftBarButtonItems()
        setupRightBarButtonItems()
    }
    
    /**
     Setup right bar button items inside the navigation bar
     */
    private func setupRightBarButtonItems() {
        
        var rightBarButtonItems = [UIBarButtonItem]()
        
        let profileButton = UIButton(type: .system)
        profileButton.setTitle("HOME", for: .normal)
        profileButton.setTitleColor(UIColor.black, for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        rightBarButtonItems.append(UIBarButtonItem(customView: profileButton))
        
        navigationItem.rightBarButtonItems = rightBarButtonItems
    }
    
    /**
     Setup navigation bar properties
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
        
        self.navigationItem.title = "ART & CULTURE"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.black
        ]
    }
    
    // MARK: - Selectors
    
    @objc func back(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let artAndMuseum = selectedArtAndMuseum, let buyArtAndMuseumTicketViewController = segue.destination as? BuyArtAndMuseumTicketTableViewController else { return }
        
        buyArtAndMuseumTicketViewController.artAndMuseum = artAndMuseum
    }
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.delegate = self
        self.setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedArtAndMuseum = dataSource.artAndMuseum(at: indexPath)
        self.performSegue(withIdentifier: "BuyArtAndMuseumTicket", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
