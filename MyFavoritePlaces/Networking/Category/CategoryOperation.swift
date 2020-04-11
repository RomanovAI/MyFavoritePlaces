//
//  CategoryOperation.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class CategoryOperation {
    
    let endPoint = "categories.json"
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchList(completion: @escaping (Result<[CategoryResponseModel], ServiceError>) -> Void) {
        let request = Request(endPoint: endPoint, method: .GET, model: nil)
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
    
    func add(categoryEntity: CategoryEntity, completion: @escaping (Result<[CategoryResponseModel], ServiceError>) -> Void) {
        var model = CategoryRequestModel()
        model.add(category: categoryEntity)
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


    


