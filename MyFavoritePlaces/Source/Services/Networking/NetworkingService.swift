//
//  NetworkingService.swift
//  MyFavoritePlaces
//
//  Created by Артем Романов on 10.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


enum ServiceError: Error {
    case failedRequest(Error)
    case failedData
    case parsingError(NSString)
    
    var localizedDescription: String {
        switch self {
        case .failedRequest(let error):
            return error.localizedDescription
        case .failedData:
            return "Некорректная дата"
        case .parsingError(let dataString):
            return "Ошибка при парсинге: \(dataString)"
        }
    }
}


class NetworkingService: NetworkServiceProtocol {
    
    private var baseURL: URL
    
    init?() {
        guard let url = URL(string: "https://placer-6c800.firebaseio.com/") else { return nil }
        baseURL = url
    }
    
    
    func execute(request: RequestProtocol, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        let url = baseURL.appendingPathComponent(request.endPoint)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.stringValue
        
        urlRequest.httpBody = request.model?.encodeToJSONData()
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            DispatchQueue.global(qos: .userInteractive).async {
                if let error = error  {
                    completion(.failure(.failedRequest(error)))
                    return
                }
                
                guard let data = data else  {
                    completion(.failure(.failedData))
                    return
                }
                
                completion(.success(data))
            }
        }).resume()
    }
    
}


