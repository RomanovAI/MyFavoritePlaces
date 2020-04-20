//
//  CategoryOperation.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class CategoryOperation {
    
    let endPoint = "categories"
    private var service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func fetchList(completion: @escaping (Result<[CategoryResponseModel], ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint).json"
        let request = Request(endPoint: endPoint, method: .get, model: nil)
        service.execute(request: request, completion: { result in
            switch result {
            case .success(let data):
                do {
                    typealias typeAlias = [String: CategoryResponseModel]
                    let object = try JSONDecoder().decode(typeAlias.self, from: data)
                    var objectArray = [CategoryResponseModel]()
                    for (_, value) in object {
                        objectArray.append(value)
                    }
                    completion(.success(objectArray))
                } catch {
                    guard let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                    completion(.failure(.parsingError(dataString)))
                }
            case .failure(let error):
                print("ERROR=", error)
                completion(.failure(error))
            }
        })
    }
    
    func add(categoryEntity: CategoryEntity, completion: @escaping (Result<CategoryResponseModel, ServiceError>) -> Void) {
        let endPoint = self.endPoint + ".json"
        let requsetModel = CategoryRequestModel()
        requsetModel.add(category: categoryEntity)
        let request = Request(endPoint: endPoint, method: .patch, model: requsetModel.dictionary)
        
        service.execute(request: request,  completion: { result in
            switch result {
            case .success(let data):
                do {
                    typealias typeAlias = [String: CategoryResponseModel]
                    let object = try JSONDecoder().decode(typeAlias.self, from: data)
                    if let model = object[categoryEntity.id] {
                        completion(.success(model))
                    }
                } catch {
                    guard let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                    completion(.failure(.parsingError(dataString)))
                }
            case .failure(let error):
                print("ERROR=", error)
                completion(.failure(error))
            }
        })
    }
    
    func delete(categoryEntity: CategoryEntity, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint)/\(categoryEntity.id).json"
        
        let request = Request(endPoint: endPoint, method: .delete, model: nil)
        
        service.execute(request: request,  completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print("ERROR=", error)
                completion(.failure(error))
            }
        })
    }
    
    
}





