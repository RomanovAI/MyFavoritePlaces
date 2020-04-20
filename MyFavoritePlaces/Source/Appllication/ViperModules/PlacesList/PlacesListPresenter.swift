//
//  PlacesListPresenter.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class PlacesListPresenter: PlacesListPresenterProtocol {
    
    weak private var view: PlacesListViewProtocol?
    var interactor: PlacesListInteractorProtocol?
    private let router: PlacesListRouterProtocol
    
    init(view: PlacesListViewProtocol,
         interactor: PlacesListInteractorProtocol?,
         router: PlacesListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var placeTableModel = PlaceTableModel()
    
    func viewDidLoad() {
        guard let interactor = interactor else { return }
        interactor.fetchPlacesList()
    }
    
    func makeStructure() {
        placeTableModel.clear()
        guard let interactor = interactor else { return }
        var models = [PlaceTableCellModel]()
        for place in interactor.places {
            let cellModel = makeCellModel(entity: place)
            models.append(cellModel)
        }
        placeTableModel.placeCellModels = models
        view?.reloadTable()
    }
    
    private func makeCellModel(entity: PlaceEntity) -> PlaceTableCellModel  {
        let model = PlaceTableCellModel()
        model.title = entity.name
        model.image = UIImage(named: "Image")
        model.rating = entity.rating
        model.categories = entity.categories
        return model
    }
    
}




