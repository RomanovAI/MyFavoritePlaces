//
//  PlacesListPresenter.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

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

    var placeTableStructure: PlaceTableStructure?
    
    func viewDidLoad() {
        guard let places = interactor?.places else { return }
        placeTableStructure = PlaceTableStructure(placesList: places)
        interactor?.fetchPlacesList()
    }
}




