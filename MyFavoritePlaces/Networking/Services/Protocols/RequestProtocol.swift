//
//  RequestProtocol.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


enum RequestMethod {
    case GET
    case PATCH
    case DELETE
    
    var stringValue: String {
        switch self {
        case .GET:
            return "GET"
        case .DELETE:
            return "DELETE"
        case .PATCH:
            return "PATCH"
        }
    }
}

protocol RequestProtocol {
    
    var endPoint: String { get set }
    var method: RequestMethod { get set }
    var model: Encodable? { get set }
}

