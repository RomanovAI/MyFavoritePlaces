//
//  CreateNewPlacePresenter.swift
//  MyFavoritePlaces
//
//  Created Артем Романов on 13.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

final class CreateNewPlacePresenter: CreateNewPlacePresenterProtocol {

    weak private var view: CreateNewPlaceViewProtocol?
    var interactor: CreateNewPlaceInteractorProtocol?
    private let router: CreateNewPlaceRouterProtocol

    init(view: CreateNewPlaceViewProtocol,
        interactor: CreateNewPlaceInteractorProtocol?,
        router: CreateNewPlaceRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
