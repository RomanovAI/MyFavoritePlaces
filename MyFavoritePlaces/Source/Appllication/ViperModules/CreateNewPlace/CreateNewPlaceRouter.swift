//
//  CreateNewPlaceRouter.swift
//  MyFavoritePlaces
//
//  Created Артем Романов on 13.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class CreateNewPlaceRouter: CreateNewPlaceRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {

        let view = CreateNewPlaceViewController(nibName: nil, bundle: nil)
        let interactor = CreateNewPlaceInteractor()
        let router = CreateNewPlaceRouter()
        let presenter = CreateNewPlacePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
