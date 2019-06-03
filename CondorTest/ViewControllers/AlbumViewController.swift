//
//  AlbumViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class AlbumViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    lazy var presenter: AlbumPresenter = {
        let presenter = AlbumPresenter()
        presenter.delegate = self
        return presenter
    }()

    var source:Source<AlbumTableViewCell>?
    var artist:Artist?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSource()
        self.setupTableView()
        self.fetchAlbums()
    }

    func setSource() {
        self.source = Source(identifier: AlbumTableViewCell.className)
    }

    func setupTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerNib(AlbumTableViewCell.self)
        self.tableView.separatorStyle = .none
    }

    func fetchAlbums() {
        guard let id = artist?.id else {
            return
        }
        presenter.fetchAlbums(id: id)
    }

    func update() {
        self.tableView.dataSource = self.source
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

extension AlbumViewController: BaseProtocol {

}
