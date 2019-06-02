//
//  ArtistRepositoryMock.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class ArtistRepositoryMock: ArtistRepositoryProtocol {
    func fetchArtist(name: String, succes: @escaping SuccesCompletionBlock, failure: @escaping FailureCompletionBlock) {
        if let path = Bundle.main.path(forResource: "mock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {

                }
            } catch {
                // handle error
            }
        }
    }
}
