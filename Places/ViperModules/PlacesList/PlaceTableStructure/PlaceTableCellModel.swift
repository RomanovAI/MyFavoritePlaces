//
//  PlaceTableCellModel.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlaceTableCellModel {
    
    private var place: Place
    
    var title: String {
        return place.name
    }
    
    var image: UIImage? {
        return place.image
    }
    
    var rating: Int? {
        return place.rating
    }
    
    var categories: [Category] {
        return place.categories
    }
    
    var backgroundColor: UIColor?
    
    init(place: Place) {
        self.place = place
    }
}
