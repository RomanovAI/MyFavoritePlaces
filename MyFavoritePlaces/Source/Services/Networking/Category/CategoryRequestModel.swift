//
//  CategoryRequestModel.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 11.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class CategoryRequestModel: Encodable {
    
    var dictionary = [String: CategoryEntity]()
    
    func add(category: CategoryEntity) {
        dictionary[category.id] = category
    }
}
