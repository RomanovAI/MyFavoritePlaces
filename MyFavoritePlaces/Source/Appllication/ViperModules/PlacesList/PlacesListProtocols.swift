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
    
    var placeTableModel: PlaceTableModel { get }
    
    func viewDidLoad()
    func makeStructure()
}

protocol PlacesListInteractorProtocol: class {

    var presenter: PlacesListPresenterProtocol?  { get set }
    
    var places: [PlaceEntity] { get }
    var categories: [CategoryEntity] { get }
    
    func fetchData() 
}

protocol PlacesListViewProtocol: class {

    var presenter: PlacesListPresenterProtocol?  { get set }
    
    func reloadTable()
}
