//
//  MapViewController.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class MapViewController: UIViewController, MapViewProtocol {

	var presenter: MapPresenterProtocol?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTabBarItem() {
        guard let mapImage = UIImage(named: "Map") else { return }
        tabBarItem = UITabBarItem(title: "Карта", image: mapImage, tag: 0)
    }

}
