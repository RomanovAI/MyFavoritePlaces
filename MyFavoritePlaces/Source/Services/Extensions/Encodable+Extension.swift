//
//  Encodable+Extension.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 11.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

extension Encodable {
    func encodeToJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
