//
//  CategoryEntity.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

struct CategoryEntity: Encodable {
    let id: String
    let name: String
    let color: String
}

extension CategoryEntity {
    init?(model: CategoryResponseModel) {
        guard
            let id = model.id,
            let name = model.name,
            let color = model.color
            else { return nil }
        self.id = id
        self.name = name
        self.color = color
    }
}
