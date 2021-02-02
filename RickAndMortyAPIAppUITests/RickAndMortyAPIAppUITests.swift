//
//  RickAndMortyAPIAppUITests.swift
//  RickAndMortyAPIAppUITests
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import XCTest

class RickAndMortyAPIAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
       app = XCUIApplication()
       app.launch()
        
       continueAfterFailure = false

    }

    func testCharactersScreen() throws {
        let firstCharacterSelected = app.collectionViews.children(matching: .any).element(boundBy: 0)
        if firstCharacterSelected.exists {
            firstCharacterSelected.tap()
        }
    }
    
    func testNavigationBarTitle() throws {
        XCTAssertTrue(app.navigationBars.staticTexts["Characters"].exists) 
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
