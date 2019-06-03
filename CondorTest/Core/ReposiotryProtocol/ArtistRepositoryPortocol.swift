//
//  ArtistRepositoryPortocol.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

typealias SuccesCompletionBlock = ([Artist]) -> Void
typealias FailureCompletionBlock = (NSError) -> Void

protocol ArtistRepositoryProtocol {
    func fetchArtist(name: String, succes:@escaping SuccesCompletionBlock , failure:@escaping FailureCompletionBlock)
}
