//
//  PlaceOperation.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


class PlaceOperation {
    
    let endPoint = "places.json"
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchList(completion: @escaping (Result<[PlaceResponseModel], ServiceError>) -> Void) {
        let request = Request(endPoint: endPoint, method: .GET, model: nil)
        service.execute(request: request, responseType: PlaceResponseModel.self, completion: { result in
            switch result {
            case .success(let models):
                print("&&&&&&&&&&&&", models.count)
                completion(.success(models))
            case.failure(let error):
                print("##########", error.localizedDescription)
                completion(.failure(error))
            }
        })
    }
    
    func add(placeEntity: PlaceEntity, completion: @escaping (Result<[CategoryResponseModel], ServiceError>) -> Void) {
        var model = PlaceRequestModel()
        model.add(place: placeEntity)
        let request = Request(endPoint: endPoint, method: .PATCH, model: model.dict)
        
        service.execute(request: request, responseType: CategoryResponseModel.self, completion: { result in
            switch result {
            case .success(let models):
                print("MODELS=", models)
                completion(.success(models))
            case .failure(let error):
                print("ERROR=", error)
                completion(.failure(error))
            }
        })
    }
    
}
