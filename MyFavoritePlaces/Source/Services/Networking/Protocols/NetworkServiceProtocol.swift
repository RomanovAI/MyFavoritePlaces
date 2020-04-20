//
//  ServiceProtocol.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func execute(request: RequestProtocol, completion: @escaping (Result<Data, ServiceError>) -> Void)
  
}
