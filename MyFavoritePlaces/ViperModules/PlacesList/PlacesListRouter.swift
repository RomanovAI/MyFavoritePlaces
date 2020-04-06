//
//  PlacesListRouter.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class PlacesListRouter: PlacesListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {

        let view = PlacesListViewController(nibName: nil, bundle: nil)
        let interactor = PlacesListInteractor()
        let router = PlacesListRouter()
        let presenter = PlacesListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
