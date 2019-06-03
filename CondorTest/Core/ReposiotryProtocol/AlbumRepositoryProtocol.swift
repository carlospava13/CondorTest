//
//  AlbumRepositoryProtocol.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

typealias SuccesAlbumCompletionBlock = ([Album]) -> Void
typealias FailureAlbumCompletionBlock = (NSError) -> Void

protocol AlbumRepositoryProtocol {
    func fetchAlbum(id: String, succes:@escaping SuccesAlbumCompletionBlock , failure:@escaping FailureAlbumCompletionBlock)
}
