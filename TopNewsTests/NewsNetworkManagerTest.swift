//
//  NewsNetworkManagerTest.swift
//  TopNewsTests
//
//  Created by Ioanna Karageorgou on 15/2/23.
//

import XCTest
@testable import TopNews

final class NewsNetworkManagerTest: XCTestCase {
    
    private var testNewsNetworkManager : TestNewsNetworkManager?
    private let numOfNews = 10

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testNewsNetworkManager = TestNewsNetworkManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testNewsNetworkManager = nil
    }

    func testSuccessfulFetching() {
        let expectation = self.expectation(description: "waiting to fetch data")
        var newsArray : [News]?
        testNewsNetworkManager?.testNewsNetworkManagerType = TestNewsNetworkManagerType.successResponse
        testNewsNetworkManager?.fetchTopNews({ (result) in
            switch result {
            case .success(let newsList):
                newsArray = newsList.news
                expectation.fulfill()
            case .failure(let error):
                newsArray = []
                XCTFail("expected to fetch data but got error: \(error)")
            }
        })
        
        waitForExpectations(timeout: 3.0) { _ in XCTAssertEqual(newsArray?.count, self.numOfNews)}
    }

    func testFailedFetching() {
        let expectation = self.expectation(description: "waiting to fetch data")
        var newsArray : [News]?
        testNewsNetworkManager?.testNewsNetworkManagerType = TestNewsNetworkManagerType.errorResponse
        testNewsNetworkManager?.fetchTopNews({ (result) in
            switch result {
            case .success(_):
                XCTFail("expected no response")
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                newsArray = []
                expectation.fulfill()
            }
        })
        
        waitForExpectations(timeout: 3.0) { _ in XCTAssertEqual(newsArray?.count, 0)}
    }
}
