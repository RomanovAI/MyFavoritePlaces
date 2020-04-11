//
//  PlacesListProtocols.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol PlacesListRouterProtocol: class {

}

protocol PlacesListPresenterProtocol: class {
    
    var placeTableStructure: PlaceTableStructure? { get }
    
    func viewDidLoad()
}

protocol PlacesListInteractorProtocol: class {

    var presenter: PlacesListPresenterProtocol?  { get set }
    
    var places: [PlaceEntity] { get }
    
    func fetchPlacesList() 
}

protocol PlacesListViewProtocol: class {

    var presenter: PlacesListPresenterProtocol?  { get set }
    
    func reloadTable()
}
