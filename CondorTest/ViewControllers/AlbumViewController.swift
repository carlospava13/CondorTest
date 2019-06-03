//
//  AlbumViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class AlbumViewController: BaseViewController {
    // MARK: - IBOUtlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var source:Source<AlbumTableViewCell>?
    var artist:Artist?
    var route:AlbumRoute?
    lazy var presenter: AlbumPresenter = {
        let presenter = AlbumPresenter()
        presenter.delegate = self
        return presenter
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setRoute()
        self.setSource()
        self.setupTableView()
        self.fetchAlbums()
    }

    fileprivate func setRoute() {
        self.route = AlbumRoute(parentViewController: self)
    }

    fileprivate func setSource() {
        self.source = Source(identifier: AlbumTableViewCell.className)
    }

    fileprivate func setupTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerNib(AlbumTableViewCell.self)
        self.tableView.separatorStyle = .none
    }

    fileprivate func fetchAlbums() {
        guard let id = artist?.id else {
            return
        }
        presenter.fetchAlbums(id: id)
    }

    fileprivate func update() {
        self.tableView.dataSource = self.source
        self.tableView.delegate = self.source
        self.tableView.reloadData()
    }
}

extension AlbumViewController: AlbumPresenterProtocol {
    func getAlbums(albums: [Album]) {
        self.source?.setData(data: albums, delegate: self)
        self.update()
    }

    func failure(error: NSError) {
        self.showAlert(title: ConstantsError.error, subTitle: error.domain, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension AlbumViewController: AlbumCellProtocol {
    func didSelected(album: Album) {
        self.route?.showAlbumDetailViewController(album: album)
    }
}
