//
//  AlbumPresenter.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

protocol AlbumPresenterProtocol {
    func getAlbums(albums:[Album])
    func failure(error:NSError)
}


class AlbumPresenter: NSObject {
    lazy var manager:AlbumManager = AlbumManager()
    var delegate:AlbumPresenterProtocol?

    func fetchAlbums(id:String) {
        manager.fetchAlbum(id: id, succes: { (albums) in
            self.delegate?.getAlbums(albums: albums)
        }) { (error) in
            self.delegate?.failure(error: error)
        }
    }
}
