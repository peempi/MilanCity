//
//  TravellingViewControlleTableViewCell.swift
//  MilanCity
//
//  Created by Federico Castelli on 18/03/18.
//  Copyright © 2018 Pimpi. All rights reserved.
//

import UIKit

class TravellingViewControlleTableViewCell: UITableViewCell {

    public static let reusableIdentifier = "TravellingViewCell"
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var travellingImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configure(with indexPath: IndexPath) {
        
        var image: UIImage?
        var title: String?
        var caption: String?
        switch indexPath.row {
        case 0:
            image = #imageLiteral(resourceName: "tram")
            title = "TRAVELLING"
            caption = "Manage your travel and purchase your tickets"
            break
        case 1:
            image = #imageLiteral(resourceName: "Museo-900-Sala-Fontana (1)")
            title = "ART & CULTURE"
            caption = "Discover the Italian Culture and its Traditions"
            break
        case 2:
            image = #imageLiteral(resourceName: "eventi")
            title = "EVENTS"
            caption = "Concerts, Shows, Conferences and much more"
            break
        case 3:
            image = #imageLiteral(resourceName: "Restaurant")
            title = "BAR & RESTAURANT"
            caption = "Nothing is better than some good food"
            break
        default: return
        }
        travellingImageView.image = image
        titleLabel.text = title
        captionLabel.text = caption
        viewCell.elevate(elevation: 4.0)
    }
}
