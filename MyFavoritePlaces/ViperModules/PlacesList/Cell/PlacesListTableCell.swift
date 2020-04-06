//
//  PlacesListTableCell.swift
//  Places
//
//  Created by Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlacesListTableCell: UITableViewCell {
    
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
    
    @IBOutlet weak var categoriesPanel: CategoriesPanel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    func setup(with model: PlaceTableCellModel) {
        backgroundColor = model.backgroundColor
        placeImageView.image = model.image
        titleLabel.text = model.title
        ratingControl.rating = model.rating ?? 0
        categoriesPanel.setupCategories(categories: model.categories)
    }
    
}
