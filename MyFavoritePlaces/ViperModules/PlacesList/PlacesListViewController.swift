//
//  PlacesListViewController.swift
//  Places
//
//  Created Артем Романов on 30.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

final class PlacesListViewController: UIViewController, PlacesListViewProtocol {
    
    var presenter: PlacesListPresenterProtocol?
    
    private let placesListTableCell = "PlacesListTableCell"
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .white
            tableView.register(UINib(nibName: placesListTableCell, bundle: .main), forCellReuseIdentifier: placesListTableCell)
            tableView.separatorStyle = .none
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customGrey
        setupNavBar()
        
        //        tableView.rowHeight = tableView.estimatedRowHeight
        //        tableView.estimatedRowHeight = UITableView.automaticDimension
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    func reloadTable() {
           tableView.reloadData()
       }
    
    private func setupNavBar() {
        navigationItem.title = "Места"
        let navBar = navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
        navBar?.layer.cornerRadius = 12
        navBar?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        navBar?.layer.masksToBounds = true
        
        
        let plusImage = UIImage(named: "Plus")
        let rightBarItem = UIBarButtonItem(image: plusImage, style: .done, target: self, action: #selector(add))
        rightBarItem.tintColor = UIColor.customOrange
        navigationItem.rightBarButtonItem = rightBarItem
        setupSearchController()
    }
    
    @objc private func add() {
        let ac = UIAlertController(title: "Сортировка списка", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "По алфавиту", style: .default, handler: { _ in })
        let action2 = UIAlertAction(title: "По рейтингу", style: .default, handler: { _ in })
        let action3 = UIAlertAction(title: "По удаленности", style: .default, handler: { _ in })
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
    
        ac.addAction(action1)
        ac.addAction(action2)
        ac.addAction(action3)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    func setupSearchController() {
        let searchController = UISearchController()
        searchController.delegate = self
        searchController.searchBar.placeholder = "Искать"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func setupTabBarItem() {
        guard let listImage = UIImage(named: "List") else { return }
        tabBarItem = UITabBarItem(title: "Список", image: listImage, tag: 2)
    }
    
}

extension PlacesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.placeTableModel.placeCellModelsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: placesListTableCell, for: indexPath) as? PlacesListTableCell,
              let cellModel = presenter?.placeTableModel.cellModel(indexPath: indexPath) else { return UITableViewCell() }
        cellModel.backgroundColor = (indexPath.row % 2 == 0) ? .customGrey : .white
        cell.setup(with: cellModel)
        return cell
    }
    
    
}

extension PlacesListViewController: UITableViewDelegate {
    
}

extension PlacesListViewController: UISearchControllerDelegate {
    
}
