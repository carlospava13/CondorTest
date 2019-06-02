//
//  ArtistPresenter.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class ArtistPresenter: NSObject {
    lazy var manager:ArtistManager = ArtistManager()


    func fetchArtist(name:String) {
        manager.fetchArtist(name: name)
    }
}
