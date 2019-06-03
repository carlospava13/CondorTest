//
//  ViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class ArtistListViewController: BaseViewController {
    // MARK: - IBOUtlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var source:Source<ArtistTableViewCell>?
    var route:ArtistRoute?
    var isCurrentlyFetching: Bool = false

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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        self.setupTableView()
        self.setDataSource()
        self.setRoutes()
    }

    // MARK: - Private Methods
    fileprivate func setDataSource() {
        self.source = Source(identifier: ArtistTableViewCell.className)
    }

    fileprivate func setRoutes() {
        self.route = ArtistRoute(parentViewController: self)
    }

    fileprivate func setupTableView() {
        tableView.tableHeaderView = searchController.searchBar
        tableView.registerNib(ArtistTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
    }

    fileprivate func update() {
        self.tableView.dataSource = self.source
        self.tableView.reloadData()
    }
    /**
     This method populates the DataSource of a given valid Artist array.
     - parameters artists: An array of artist.
     */
    internal func getArtist(artists: [Artist]) {
        self.source?.setData(data: artists, delegate: self)
        self.update()
    }
}

// MARK: - UISearchResultsUpdating
extension ArtistListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
            !text.isEmpty,
            !isCurrentlyFetching else {
                return
        }
        isCurrentlyFetching = true
        presenter.fetchArtist(name: text) { [weak self] artist in
            guard let artist = artist, !artist.isEmpty else {
                self?.isCurrentlyFetching = false
                return
            }
            self?.isCurrentlyFetching = false
            self?.getArtist(artists: artist)
        }
    }
}
// MARK: - ArtistPresenterProtocol
extension ArtistListViewController: ArtistPresenterProtocol{
    func failure(error: NSError) {
        self.showAlert(title: ConstantsError.error, subTitle: error.domain) {
        }
    }
}
// MARK: - ArtistCellProtocol
extension ArtistListViewController: ArtistCellProtocol {
    func didSelected(artist: Artist) {
        self.route?.showAlbumViewController(artist: artist)
    }
}
