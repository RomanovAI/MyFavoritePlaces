//
//  PlaceTableStructure.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlaceTableModel {
    
    var placeCellModels = [PlaceTableCellModel]()
    
    var placeCellModelsCount: Int {
        return placeCellModels.count
    }
    
    func clear() {
        placeCellModels = [PlaceTableCellModel]()
    }
    
    func cellModel(indexPath: IndexPath) -> PlaceTableCellModel {
        let place = placeCellModels[indexPath.row]
        return place
    }
    
}
