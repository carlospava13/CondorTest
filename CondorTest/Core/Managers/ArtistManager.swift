//
//  ArtistManager.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class ArtistManager: BaseManager {

    var respository:ArtistRepositoryProtocol?

    override init() {
        super.init()
        self.setEnviroment()
    }

    func setEnviroment() {
        if self.isDebug {
            self.respository = ArtistRepository()
        }else {

        }
    }

    func fetchArtist(name:String) {
        self.respository?.fetchArtist(name: name)
    }
}
