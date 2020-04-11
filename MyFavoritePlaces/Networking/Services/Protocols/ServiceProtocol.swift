//
//  ServiceProtocol.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    
    func execute<T: Decodable>(request: RequestProtocol, responseType: T.Type, completion: @escaping (Result<[T], ServiceError>) -> Void)
  
}
