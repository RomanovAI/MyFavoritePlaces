//
//  CreateNewPlaceProtocols.swift
//  MyFavoritePlaces
//
//  Created Артем Романов on 13.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol CreateNewPlaceRouterProtocol: class {

}

protocol CreateNewPlacePresenterProtocol: class {

}

protocol CreateNewPlaceInteractorProtocol: class {

    var presenter: CreateNewPlacePresenterProtocol?  { get set }
}

protocol CreateNewPlaceViewProtocol: class {

    var presenter: CreateNewPlacePresenterProtocol?  { get set }
}
