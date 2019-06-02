//
//  ArtistRepository.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation
import Alamofire
class ArtistRepository: BaseRepository, ArtistRepositoryProtocol {

    override init() {
        super.init()
    }

    func fetchArtist(name: String) {
        let params = ["q":name, "type":"artist"]
        let token = api.token
        let url = api.urlBase + api.searchEndPoint
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: ["Authorization":token]).responseJSON { (response) in
            print(response)
        }
    }

    
}
