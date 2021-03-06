//
//  PlaceRequestModel.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 11.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class PlaceRequestModel: Encodable {
    var dictionary = [String: PlaceEntity]()
    
    func add(place: PlaceEntity) {
        dictionary[place.id] = place
    }
}
