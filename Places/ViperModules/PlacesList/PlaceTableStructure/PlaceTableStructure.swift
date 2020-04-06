//
//  PlaceTableStructure.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlaceTableStructure {
    
    private var placesList: [Place]
    
    var placesListCount: Int {
        return placesList.count
    }
    
    init(placesList: [Place]) {
        self.placesList = placesList
    }
    
    func cellModel(indexPath: IndexPath) -> PlaceTableCellModel {
        let place = placesList[indexPath.row]
        return PlaceTableCellModel(place: place)
    }
    
}
