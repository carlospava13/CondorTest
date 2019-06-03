//
//  AlbumRepository.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireMapper

class AlbumRepository: BaseRepository ,AlbumRepositoryProtocol{
    func fetchAlbum(id: String, succes: @escaping SuccesAlbumCompletionBlock, failure: @escaping FailureAlbumCompletionBlock) {
        let token = endPoint.token
        endPoint.album = id
        let url = endPoint.urlBase + endPoint.albumEndPoint

        Alamofire.request(url, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers:  ["Authorization":token]).responseObject {[weak self]  (response: DataResponse<ResponseAlbum>) in
                switch response.result {
                case let .success(data):
                    succes(data.items)
                case let .failure(error as NSError):
                    let statusCode = response.response?.statusCode
                    let generateError = error.eventHandlerError(statusCode: statusCode!)
                    failure(generateError)
                }
        }
    }
}
