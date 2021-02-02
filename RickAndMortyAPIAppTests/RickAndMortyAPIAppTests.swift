//
//  RickAndMortyAPIAppTests.swift
//  RickAndMortyAPIAppTests
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import XCTest
@testable import RickAndMortyAPIApp

class RickAndMortyAPIAppTests: XCTestCase {
    var sessionObject: URLSession!

    override func setUpWithError() throws {
        super.setUp()
        sessionObject = URLSession(configuration: .default)
        
    }

    override func tearDownWithError() throws {
        sessionObject = nil
        super.tearDown()
        
    }
    
    func testValidCallToiTunesGetsHTTPStatusCode200() {
      let url =
      URL(string: "https://rickandmortyapi.com/api/character")
      let promise = expectation(description: "Status code: 200")

      let dataTask = sessionObject.dataTask(with: url!) { data, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }
    
    func testCallToURLComplete() {
      let url =
        URL(string: "https://rickandmortyapi.com/api/character")
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      let dataTask = sessionObject.dataTask(with: url!) { data, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)

      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }
    
    

}
