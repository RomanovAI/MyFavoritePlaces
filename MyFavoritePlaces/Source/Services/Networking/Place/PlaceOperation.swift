//
//  PlaceOperation.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


class PlaceOperation {
    
    let endPoint = "places"
    private var service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func fetchList(completion: @escaping (Result<[PlaceResponseModel], ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint).json"
        let request = Request(endPoint: endPoint, method: .get, model: nil)
        service.execute(request: request, completion: { result in
            switch result {
            case .success(let data):
                do {
                    typealias typeAlias = [String: PlaceResponseModel]
                    let object = try JSONDecoder().decode(typeAlias.self, from: data)
                    var objectArray = [PlaceResponseModel]()
                    for (_, value) in object {
                        objectArray.append(value)
                    }
                    completion(.success(objectArray))
                } catch {
                    guard let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                    print("dataString=", dataString)
                    completion(.failure(.parsingError(dataString)))
                }
            case.failure(let error):
                print("##########", error.localizedDescription)
                completion(.failure(error))
            }
        })
    }
    
    func add(placeEntity: PlaceEntity, completion: @escaping (Result<PlaceResponseModel, ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint).json"
        let model = PlaceRequestModel()
        model.add(place: placeEntity)
        let request = Request(endPoint: endPoint, method: .patch, model: model.dictionary)
        
        service.execute(request: request, completion: { result in
            switch result {
            case .success(let data):
                do {
                    typealias typeAlias = [String: PlaceResponseModel]
                    let object = try JSONDecoder().decode(typeAlias.self, from: data)
                    if let model = object[placeEntity.id] {
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
    
    func delete(placeEntity: PlaceEntity, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint)/\(placeEntity.id).json"
        
        let request = Request(endPoint: endPoint, method: .delete, model: nil)
        
        service.execute(request: request,  completion: { result in
            switch result {
            case .success(let data):
                guard let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
                print("dataString=", dataString)
                completion(.success(data))
            case .failure(let error):
                print("ERROR=", error)
                completion(.failure(error))
            }
        })
    }
    
    func update(placeEntity: PlaceEntity, completion: @escaping (Result<PlaceResponseModel, ServiceError>) -> Void) {
        let endPoint = "\(self.endPoint)/\(placeEntity.id).json"
        let model = PlaceRequestModel()
        model.add(place: placeEntity)
        let request = Request(endPoint: endPoint, method: .patch, model: model.dictionary)
        
        service.execute(request: request, completion: { result in
            switch result {
            case .success(let data):
                do {
                    typealias typeAlias = [String: PlaceResponseModel]
                    let object = try JSONDecoder().decode(typeAlias.self, from: data)
                    if let model = object[placeEntity.id] {
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
    
}
