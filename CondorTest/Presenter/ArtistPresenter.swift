//
//  ArtistPresenter.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

protocol ArtistPresenterProtocol:class {
    func failure(error:NSError)
}


class ArtistPresenter: NSObject {
    lazy var manager:ArtistManager = ArtistManager()
    weak var delegate:ArtistPresenterProtocol?

    func fetchArtist(name:String, with completion: @escaping (_ : [Artist]?) -> Void) {
        manager.fetchArtist(name: name, succes: { artist in
            completion(artist)
        }) { [weak self] error in
            completion(nil)
            self?.delegate?.failure(error: error)
        }
    }
}
