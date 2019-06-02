//
//  ViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var  searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false

        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.setupTableView()

    }

    func setupTableView() {
        tableView.tableHeaderView = searchController.searchBar
    }

    func getArtist() {

    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {

    }
}
