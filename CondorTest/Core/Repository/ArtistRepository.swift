//
//  ArtistRepository.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireMapper
class ArtistRepository: BaseRepository, ArtistRepositoryProtocol {

    override init() {
        super.init()
    }



    func fetchArtist(name: String, succes:@escaping  SuccesCompletionBlock , failure:@escaping FailureCompletionBlock) {
        let params = ["q":name, "type":"artist"]
        let token = api.token
        let url = api.urlBase + api.searchEndPoint

        Alamofire.request(url, method: .get
            , parameters: params, encoding: URLEncoding.default, headers:  ["Authorization":token]).responseObject { (response: DataResponse<ResponseArtist>) in
                switch response.result {
                case let .success(data):
                    succes(data.artists.items)
                case let .failure(error):
                    failure(error)
                }
        }
    }
}
