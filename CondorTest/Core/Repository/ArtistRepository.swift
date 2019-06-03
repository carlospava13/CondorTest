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


    func fetchArtist(name: String, succes:@escaping  SuccesCompletionBlock , failure:@escaping FailureCompletionBlock) {
        let params = [Constants.Parameter.query:name, Constants.Parameter.type:Constants.Parameter.artist]
        let token = endPoint.token
        let url = endPoint.urlBase + endPoint.searchEndPoint

        Alamofire.request(url, method: .get
            , parameters: params, encoding: URLEncoding.default, headers:  ["Authorization":token]).responseObject {[weak self]  (response: DataResponse<ResponseArtist>) in
                switch response.result {
                case let .success(data):
                    succes(data.artists.items)
                case let .failure(error as NSError):
                    let statusCode = response.response?.statusCode
                    let generateError = error.eventHandlerError(statusCode: statusCode!)
                    failure(generateError)
                }
        }
    }
}



