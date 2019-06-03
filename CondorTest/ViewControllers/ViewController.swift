//
//  ViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var  searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false

        return searchController
    }()

    lazy var presenter: ArtistPresenter = {
        let presenter = ArtistPresenter()
        presenter.delegate = self
        return presenter
    }()

    var source:Source<ArtistTableViewCell>?
    var route:ArtistRoute?

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.setupTableView()
        self.setDataSource()
        self.setRoutes()
    }

    func setDataSource() {
        self.source = Source(identifier: ArtistTableViewCell.className)
    }

    func setRoutes() {
        self.route = ArtistRoute(parentViewController: self)
    }

    func setupTableView() {
        tableView.tableHeaderView = searchController.searchBar
        tableView.registerNib(ArtistTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
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

        if !text.isEmpty {
            presenter.fetchArtist(name: text)
        }
    }
}

extension ViewController: ArtistPresenterProtocol{
    func getArtist(artists: [Artist]) {
        self.source?.setData(data: artists, delegate: self)
        self.update()
    }

    func failure(error: NSError) {
        self.showAlert(title: ConstantsError.error, subTitle: error.domain) {
        }
    }
}

extension ViewController: ArtistCellProtocol {
    func didSelected(artist: Artist) {
       self.route?.showAlbumViewController(artist: artist)
    }
}
