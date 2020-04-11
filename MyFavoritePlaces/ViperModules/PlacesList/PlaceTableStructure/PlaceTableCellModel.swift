//
//  PlaceTableCellModel.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlaceTableCellModel {
    
    var title: String?
    
    var image: UIImage?
    
    var rating: Int?
    
    var categories: [String]?
    
    var backgroundColor: UIColor?
    
    var action: (() -> Void)?
}
