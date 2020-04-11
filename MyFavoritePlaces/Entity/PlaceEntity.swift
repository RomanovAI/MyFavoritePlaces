//
//  PlaceEntity.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

struct PlaceEntity: Encodable {
    
    let id: String
    let name: String
    let image: String?
    let lat: Double
    let long: Double
    let categories: [String]
    let rating: Int?
    let descriptionShort: String?
    let descriptionLong: String?
    
}

extension PlaceEntity {
    init?(model: PlaceResponseModel) {
        guard
            let id = model.id,
            let name = model.name,
            let image = model.image,
            let lat = model.lat,
            let long = model.long,
            let categories = model.categories,
            let rating = model.rating,
            let descriptionShort = model.descriptionShort,
        let descriptionLong = model.descriptionLong
        else { return nil }
        
        self.id = id
        self.name = name
        self.image = image
        self.lat = lat
        self.long = long
        self.categories = categories
        self.rating = rating
        self.descriptionShort = descriptionShort
        self.descriptionLong = descriptionLong
    }
}
