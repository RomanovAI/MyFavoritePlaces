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
    var categories = [CategoryEntity]()
    
    init(serviceContainer: ServiceContainer) {
        self.serviceContainer = serviceContainer
    }
    
    func fetchData() {
        
        //        let place = PlaceEntity(id: "\(Date())",
        //                                name: "Москва сити",
        //                                stringUrlImage: "https://i.ytimg.com/vi/vMDA6LySU1M/maxresdefault.jpg",
        //                                lat: 55.44, long: 44.55,
        //                                categories: ["2020-04-16 14:18:32 +0000",
        //                                             "2020-04-16 14:18:54 +0000"
        //            ],
        //                                rating: 4, descriptionShort: "М сити", descriptionLong: "Москва сити в Зеленограде")
        //        addPlace(place: place)
        //        deletePlace(place: place)
        //        addCategory()
        fetchCategoriesList()
        fetchPlacesList()
    }
    
    private func fetchPlacesList() {
        places = []
        guard let service = serviceContainer.networkService else { return }
        let placeOperation = PlaceOperation(service: service)
        placeOperation.fetchList(completion: { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    
                    models.forEach({ [unowned self] model in
                        guard let placeEntity = PlaceEntity(model: model) else { return }
                        self.places.append(placeEntity)
                    })
                    self.presenter?.makeStructure()
                }
            case .failure(let error):
                print("V INTERACTORE ERROR=", error)
            }
        })
    }
    
    private func fetchCategoriesList() {
        categories = []
        guard let service = serviceContainer.networkService else { return }
        let categoryOperation = CategoryOperation(service: service)
        categoryOperation.fetchList(completion: { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    //  print("MODEL==", models)
                    models.forEach({ [unowned self] model in
                        guard let categoryEntity = CategoryEntity(model: model) else { return }
                        self.categories.append(categoryEntity)
                    })
                }
            case .failure(let error):
                print("V INTERACTORE ERROR=", error)
            }
            
        })
    }
    
    
    //    func addPlace(place: PlaceEntity) {
    //        guard let service = serviceContainer.networkService else { return }
    //        let placeOperation = PlaceOperation(service: service)
    //        placeOperation.add(placeEntity: place, completion: { result in
    //            switch result {
    //            case .success(let model):
    //                print("0000=", model)
    //            case .failure(let error):
    //                print("error=", error.localizedDescription)
    //            }
    //
    //        })
    //    }
    //
    //    func deletePlace(place: PlaceEntity) {
    //        guard let service = serviceContainer.networkService else { return }
    //        let placeOperation = PlaceOperation(service: service)
    //        placeOperation.delete(placeEntity: place, completion: { result in
    //            switch result {
    //            case .success(let model):
    //                print("MODEL==", model)
    //            case .failure(let error):
    //                print(error)
    //                break
    //            }
    //        })
    //    }
    //
    //    func updatePlace(place: PlaceEntity) {
    //        guard let service = serviceContainer.networkService else { return }
    //        let placeOperation = PlaceOperation(service: service)
    //        placeOperation.delete(placeEntity: place, completion: { result in
    //            switch result {
    //            case .success(let model):
    //                print("MODEL==", model)
    //            case .failure(let error):
    //                print(error)
    //                break
    //            }
    //        })
    //    }
    
    
    //        func addCategory() {
    //            guard let service = serviceContainer.networkService else { return }
    //            let categoryOperation = CategoryOperation(service: service)
    //            let category = CategoryEntity(id:"\(Date())", name: "Достопримечательности", color: "0f993")
    //            categoryOperation.add(categoryEntity: category, completion: { result in
    //                switch result {
    //                case .success(let model):
    //                        print("MODEL==", model)
    //                case .failure(let error):
    //                    print(error)
    //                    break
    //                }
    //            })
    //        }
    //
    //    func deleteCategory(category: CategoryEntity) {
    //           guard let service = serviceContainer.networkService else { return }
    //           let categoryOperation = CategoryOperation(service: service)
    //           categoryOperation.delete(categoryEntity: category, completion: { result in
    //               switch result {
    //               case .success(let model):
    //                       print("MODEL==", model)
    //               case .failure(let error):
    //                   print(error)
    //                   break
    //               }
    //           })
    //       }
}
