//
//  PlacesListInteractor.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class PlacesListInteractor: PlacesListInteractorProtocol {
    
    weak var presenter: PlacesListPresenterProtocol?
    private var serviceContainer: ServiceContainer
    
    var places = [PlaceEntity]()
    
    
    init(serviceContainer: ServiceContainer) {
        self.serviceContainer = serviceContainer
    }
    
    func fetchPlacesList() {
        places = [PlaceEntity]()
        guard let service = serviceContainer.networkService else { return }
        let placeOperation = PlaceOperation(service: service)
        
        placeOperation.fetchList(completion: { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    print("MODEL==", models)
                    models.forEach({ [unowned self] model in
                        guard let placeEntity = PlaceEntity(model: model) else { return }
                        self.places.append(placeEntity)
                    })
                    self.presenter?.makeStructure()
                }
            case .failure(let error):
                print("V INTERACTORE ERROR=", error)
                return
            }

        })
    }
    
//    func fetchCategoriesList() {
//        guard let service = serviceContainer.networkService else { return }
//        let categoryOperation = CategoryOperation(service: service)
//        categoryOperation.fetchList(completion: { result in
//            switch result {
//            case .success(let models):
//                DispatchQueue.main.async {
//                    print("MODEL==", models)
//                }
//            case .failure(let error):
//                print(error)
//            }
//            
//        })
//    }
    
//    func add() {
//        guard let service = serviceContainer.networkService else { return }
//        let categoryOperation = CategoryOperation(service: service)
//        let category = CategoryEntity(name: "Сады", color: "e8887")
//        categoryOperation.add(categoryEntity: category, completion: { result in
//            switch result {
//            case .success(let models):
//                DispatchQueue.main.async {
//                    print("MODEL==", models)
//                }
//            case .failure(let error):
//                print(error)
//                break
//            }
//            
//        })
//    }
}
