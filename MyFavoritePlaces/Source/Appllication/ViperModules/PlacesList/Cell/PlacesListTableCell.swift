//
//  PlacesListTableCell.swift
//  Places
//
//  Created by Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlacesListTableCell: UITableViewCell {
    
    var model: PlaceTableCellModel? {
        willSet(model) {
            backgroundColor = model?.backgroundColor
            placeImageView.image = model?.image
            placeImageView.sizeToFit()
            titleLabel.text = model?.title
            ratingControl.rating = model?.rating ?? 0
        }
    }
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
        }
    }
    
    @IBOutlet weak var ratingControl: RatingControl! {
        didSet {
            ratingControl.isUserInteractionEnabled = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}

