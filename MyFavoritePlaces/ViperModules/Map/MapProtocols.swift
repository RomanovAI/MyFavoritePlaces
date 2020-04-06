//
//  MapProtocols.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol MapRouterProtocol: class {

}

protocol MapPresenterProtocol: class {

}

protocol MapInteractorProtocol: class {

    var presenter: MapPresenterProtocol?  { get set }
}

protocol MapViewProtocol: class {

    var presenter: MapPresenterProtocol?  { get set }
}
