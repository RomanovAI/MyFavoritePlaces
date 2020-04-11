//
//  CategoriesPanel.swift
//  Places
//
//  Created by Артем Романов on 05.04.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

@IBDesignable class CategoriesPanel: UIStackView {
    
    func setupCategories(categories: [CategoryEntity]) {
        spacing = 4

        for category in categories {
            
            let label = UILabel()
            
            label.text = category.name
            label.font = UIFont.systemFont(ofSize: 9)
            label.backgroundColor = UIColor(hex: category.color)    
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: 13).isActive = true
            
            label.layer.cornerRadius = 7
            label.layer.masksToBounds = true
            
            label.numberOfLines = 0
            
            addArrangedSubview(label)
        }
        
    }
}
