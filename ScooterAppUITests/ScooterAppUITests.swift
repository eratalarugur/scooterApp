//
//  ScooterAppUITests.swift
//  ScooterAppUITests
//
//  Created by Eratalar, Ali Ugur (401) on 23.02.2022.
//

import XCTest

class ScooterAppUITests: XCTestCase {

    func setupApp() ->  XCUIApplication {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        return app
    }
    
    func test_map_should_not_display_any_annotations_when_no_vehicle_fetched() {
        let app = setupApp()
        let map = app.maps["vehicleMap"].waitForExistence(timeout: 2.0)
        XCTAssertNotNil(map)
    }
}
