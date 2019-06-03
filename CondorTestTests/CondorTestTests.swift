//
//  CondorTestTests.swift
//  CondorTestTests
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import XCTest
@testable import CondorTest

class CondorTestTests: XCTestCase {


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       // manager = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetArtist() {
        let manager = ArtistManager()
        let fecthExpectation = expectation(description: "TO retrieve a list of artists")
        manager.fetchArtist(name: "sf", succes: { (result) in
            if !result.isEmpty {
                fecthExpectation.fulfill()
            }
        }, failure: { error in
            XCTestError(_nsError: error)
        })
        waitForExpectations(timeout: 10, handler: nil)
    }
}
