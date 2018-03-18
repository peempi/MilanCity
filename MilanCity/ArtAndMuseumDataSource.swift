//
//  ArtAndMuseumDataSource.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class ArtAndMuseumDataSource: NSObject, UITableViewDataSource {
    
    private var artAndMuseums = [ArtAndMuseum]()
    
    init(artAndMuseums: [ArtAndMuseum]) {
        self.artAndMuseums = artAndMuseums
    }
    
    func update(with artAndMuseums: [ArtAndMuseum]) {
        self.artAndMuseums = artAndMuseums
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artAndMuseums.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let artAndMuseumCell = tableView.dequeueReusableCell(withIdentifier: ArtAndMuseumTableViewCell.reusableIdentifier, for: indexPath) as? ArtAndMuseumTableViewCell else {
            return UITableViewCell()
        }
        let artAndMuseum = self.artAndMuseum(at: indexPath)
        artAndMuseumCell.configure(with: artAndMuseum)
        return artAndMuseumCell
    }
    
    
    func artAndMuseum(at indexPath: IndexPath) -> ArtAndMuseum {
        return artAndMuseums[indexPath.row]
    }
}
