//
//  PlaceRequestModel.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 11.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class PlaceRequestModel: Encodable {
    var dict = [String: PlaceEntity]()
    
    func add(place: PlaceEntity) {
        dict[place.name] = place
    }
}
