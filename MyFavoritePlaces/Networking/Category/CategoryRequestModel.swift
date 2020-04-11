//
//  CategoryRequestModel.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 11.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

struct CategoryRequestModel: Encodable {
    
    var dict = [String: CategoryEntity]()
    
    mutating func add(category: CategoryEntity) {
        dict[category.name] = category
    }
}
