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
    
    let places = [
        PlaceEntity(id: "\(Date())",
            name: "Красная площадь",
            image: UIImage(named: "Image"),
            lat: 55.0, long: 77.0,
            categories: [Category(id: "1", name: "Достопримечательность", color: .systemRed)],
            rating: 5, shortDescription: "Красная площадь в Москве", longDescription: "Красная площадь в Москве"),
        PlaceEntity(id: "\(Date())",
            name: "Воробьевы горы",
            image: UIImage(named: "Image"),
            lat: 75.0, long: 17.0,
            categories: [Category(id: "1", name: "Достопримечательность", color: .systemRed)],
            rating: 2, shortDescription: nil, longDescription: nil),
        PlaceEntity(id: "\(Date())",
            name: "Лужники",
            image: UIImage(named: "Image"),
            lat: 55.0, long: 77.0,
            categories: [Category(id: "2", name: "Спорт", color: .systemBlue)],
            rating: 3, shortDescription: "Лужники в Москве", longDescription: "Лужники в Москве"),
        PlaceEntity(id: "\(Date())",
            name: "Парк Зарядье",
            image: UIImage(named: "Image"),
            lat: 55.0, long: 77.0,
            categories: [
                Category(id: "1", name: "Достопримечательность", color: .systemRed),
                Category(id: "1", name: "Достопримечательность", color: .systemRed),
                Category(id: "1", name: "Достопримечательность", color: .systemRed),
                Category(id: "1", name: "Достопримечательность", color: .systemRed),
                Category(id: "3", name: "Отдых", color: .systemGreen)],
            rating: 4, shortDescription: "Парк Зарядье в Москве", longDescription: "Парк Зарядье в Москве"),
        PlaceEntity(id: "\(Date())",
            name: "Останкинская башня",
            image: UIImage(named: "Image"),
            lat: 55.0, long: 77.0,
            categories: [Category(id: "1", name: "Достопримечательности", color: .systemRed)],
            rating: 1, shortDescription: "Останкинская башня в Москве", longDescription: "Останкинская башня в Москве"),
    ]
    
    init(serviceContainer: ServiceContainer) {
        self.serviceContainer = serviceContainer
    }
    
    func fetchPlacesList() {
        guard let service = serviceContainer.networkService else { return }
        let placesOperation = PlacesOperation(service: service)
        placesOperation.getList(completion: { result in
            switch result {
            case .success(let model):
                print("MODEL==", model)
                
            case .failure(let error):
                //print("V INTERACTORE ERROR=", error)
                return
            }
            
        })
    }
}
