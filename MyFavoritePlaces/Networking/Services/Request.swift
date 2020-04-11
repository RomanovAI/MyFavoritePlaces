//
//  Request.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class Request: RequestProtocol {
    
    var endPoint: String
    
    var method: RequestMethod
    
    var model: Encodable?
    
    init(endPoint: String, method: RequestMethod, model: Encodable?) {
        self.endPoint = endPoint
        self.method = method
        self.model = model
    }
}
