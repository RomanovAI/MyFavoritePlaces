//
//  MapPresenter.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

final class MapPresenter: MapPresenterProtocol {

    weak private var view: MapViewProtocol?
    var interactor: MapInteractorProtocol?
    private let router: MapRouterProtocol

    init(view: MapViewProtocol,
        interactor: MapInteractorProtocol?,
        router: MapRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
