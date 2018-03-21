//
//  ArtAndMuseumTableViewCell.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class ArtAndMuseumTableViewCell: UITableViewCell {

    public static let reusableIdentifier = "ArtAndMuseumCell"
    
    
    @IBOutlet weak var artAndMuseumStreet: UILabel!
    @IBOutlet weak var artAndMuseumName: UILabel!
    @IBOutlet weak var artAndMuseumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configure(with artAndMuseum: ArtAndMuseum) {
        artAndMuseumName.text = artAndMuseum.getStreet()
        artAndMuseumName.text = artAndMuseum.getName()
        artAndMuseumImageView.image = artAndMuseum.getImage()
    }
}
