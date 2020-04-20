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
        interactor.fetchData()
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
        if let imageData = entity.imageData, let image = UIImage(data: imageData) {
            model.image = image
        }
        model.rating = entity.rating
        var modelCategories = [CategoryCollectionCellModel]()
        interactor?.categories.forEach({ category in
            for categoryId in entity.categories {
                if category.id == categoryId {
                    let categoryCollectionCellModel = CategoryCollectionCellModel(title: category.name, color: category.color)
                    modelCategories.append(categoryCollectionCellModel)
                }
            }
        })
        model.categories = modelCategories
        return model
    }
    
}




