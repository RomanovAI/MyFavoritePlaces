//
//  Place.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

struct Place {
    
    let id: String
    let name: String
    let image: UIImage?
    let lat: Double
    let long: Double
    let categories: [Category]
    let rating: Int?
    let shortDescription: String?
    let longDescription: String?
}
