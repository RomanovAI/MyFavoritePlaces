//
//  RequestProtocol.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    var endPoint: String { get set }
    var method: RequestMethod { get set }
    var model: Encodable? { get set }
}

