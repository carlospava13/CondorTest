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
    lazy var presenter: ArtistPresenter = ArtistPresenter()
    var source:Source<ArtistTableViewCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.setupTableView()
    }

    func setDataSource() {
        self.source = Source(identifier: ArtistTableViewCell.className)
    }

    func setupTableView() {
        tableView.tableHeaderView = searchController.searchBar
        tableView.registerNib(ArtistTableViewCell.self)
    }

    func update() {
        self.tableView.dataSource = self.source
        self.tableView.reloadData()
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        presenter.fetchArtist(name: text)
    }
}
