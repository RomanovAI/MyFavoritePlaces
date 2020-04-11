//
//  PlaceResponseModel.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

struct PlaceResponseModel: Decodable {
    
    let categories: [String]?
    let descriptionLong: String?
    let descriptionShort: String?
    let id: String?
    let image: String?
    let lat: Double?
    let long: Double?
    let name: String?
    let rating: Int?
}
