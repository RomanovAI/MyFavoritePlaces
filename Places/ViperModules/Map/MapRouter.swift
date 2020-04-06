//
//  MapRouter.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class MapRouter: MapRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {

        let view = MapViewController(nibName: nil, bundle: nil)
        let interactor = MapInteractor()
        let router = MapRouter()
        let presenter = MapPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
