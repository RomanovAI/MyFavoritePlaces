//
//  PlacesTabBarController.swift
//  Places
//
//  Created by Артем Романов on 31.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlacesTabBarController: UITabBarController {
    
    let addButon: UIButton = {
        let frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        let button = UIButton(frame: frame)
        let image = UIImage(named: "Add")
        
        button.setImage(image, for: .normal)
        
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(addPlace), for: .touchUpInside)
     
        button.layer.shadowOpacity = 0.15
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 0
        return button
    }()
    
    @objc private func addPlace() {
        let createNewPlaceModule = CreateNewPlaceRouter.createModule()
        present(createNewPlaceModule, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        setupColors()
        
        view.addSubview(addButon)
        NSLayoutConstraint.activate([
            addButon.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -(addButon.frame.size.height / 3)),
            addButon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButon.heightAnchor.constraint(equalToConstant: 60),
            addButon.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupLayer() {
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 12
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupColors() {
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
            
            let tabBarItemsAppearance = UITabBarItemAppearance()
            tabBarItemsAppearance.selected.iconColor = .customOrange
            tabBarItemsAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customOrange]
            
            appearance.stackedLayoutAppearance = tabBarItemsAppearance
            appearance.inlineLayoutAppearance = tabBarItemsAppearance
            appearance.compactInlineLayoutAppearance = tabBarItemsAppearance
            
            tabBar.standardAppearance = appearance
            
        } else {
            UITabBar.appearance().tintColor = UIColor.customOrange
            UITabBar.appearance().barTintColor = .white
        }
    }
}

