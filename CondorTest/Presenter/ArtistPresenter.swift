//
//  ArtistPresenter.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

protocol ArtistPresenterProtocol {
    func getArtist(artists:[Artist])
    func failure(error:Error)
}


class ArtistPresenter: NSObject {
    lazy var manager:ArtistManager = ArtistManager()
    var delegate:ArtistPresenterProtocol?

    func fetchArtist(name:String) {
        manager.fetchArtist(name: name, succes: {[weak self] (artist) in
            self?.delegate?.getArtist(artists: artist)
        }) { (error) in
            self.delegate?.failure(error: error)
        }
    }
}
