//
//  AlbumManager.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class AlbumManager: BaseManager {

    var respository:AlbumRepositoryProtocol?

    override init() {
        super.init()
        self.setEnviroment()
    }

    func setEnviroment() {
        if self.isDebug {
            self.respository = AlbumRepository()
        }else {

        }
    }

    func fetchAlbum(id: String, succes:@escaping SuccesAlbumCompletionBlock , failure:@escaping FailureAlbumCompletionBlock){
        self.respository?.fetchAlbum(id: id, succes: { (result) in
            succes(result)
        }, failure: { (error) in
            failure(error)
        })
    }
}
