//
//  PlacesNavigationController.swift
//  Places
//
//  Created by Артем Романов on 01.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class PlacesNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatusBarBackgroundColor()
        setupNavBarColors()
        setupNavBarShadow()
    }
    
    private func setupStatusBarBackgroundColor() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.white
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.red
        }
    }
    
    private func setupNavBarColors() {
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    private func setupNavBarShadow() {
//        navigationBar.layer.shadowOpacity = 1//0.05
//        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 10)
//        navigationBar.layer.shadowRadius = 0
        
//        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
//        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
//        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
//        self.navigationController?.navigationBar.layer.masksToBounds = false
        
     navigationBar.layer.masksToBounds = false
         navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
         navigationBar.layer.shadowOpacity = 0.8
         navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
         navigationBar.layer.shadowRadius = 2
    }
    
}
