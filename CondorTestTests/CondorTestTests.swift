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

    var manager:ArtistManager?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.manager = ArtistManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        let expectation = self.expectation(description: "Scaling")
        let manager = ArtistManager()
        var array: [Artist]?
        manager.fetchArtist(name: "sf", succes: { (result) in
            array = result
            expectation.fulfill()
        }, failure: { (error) in
            expectation.fulfill()
        })
        waitForExpectations(timeout: 0.3, handler: nil)
        XCTAssert(array?.count ?? 0 > 0, "Contiene")
    }
}
