//
//  SegueingInfoiOSUITests.swift
//  SegueingInfoiOSUITests
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import XCTest

class SegueingInfoiOSUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStaticPrepareCall() {
    
        let app = XCUIApplication()
        app.tables.staticTexts["Static Prepare Call"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts[randomString].exists)
    }
    
    func testInstancePrepareCall() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Instance Prepare Call"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts[randomString].exists)
    }
    
    func testInheritedfromSegueingInfoVC() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Inherited from SegueingInfoVC"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts[randomString].exists)
    }
    
    func testDestinationIsNav() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Destination is Nav"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts[randomString].exists)
    }
    
    func testDestinationIsTab() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Destination is Tab"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts[randomString].exists)
    }
    
    func testPop() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Pop"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        
        let addTextAndSendButton = app.buttons["Add Text and Send"]
        addTextAndSendButton.tap()
        addTextAndSendButton.tap()
        app.buttons["Add Text and Pop"].tap()
        
        addTextAndSendButton.tap()
        
        // TODO: get added text from VC
        let match = randomString + " 😅 🤔 😘 🤔"
        XCTAssertTrue(app.staticTexts[match].exists)
    }
    
    func testPopTo() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Pop To"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        
        let addTextAndSendButton = app.buttons["Add Text and Send"]
        addTextAndSendButton.tap()
        addTextAndSendButton.tap()
        app.buttons["Add Text and Pop"].tap()
        
        addTextAndSendButton.tap()
        
        // TODO: get added text from VC
        let match = randomString + " 😅 🤔 😘 😅"
        XCTAssertTrue(app.staticTexts[match].exists)
    }
    
    func testPopToRoot() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["Pop To Root"].tap()
        
        let passAlongTextField = app.textFields["Pass along..."]
        passAlongTextField.tap()
        
        let randomString = String.randomString(10)
        passAlongTextField.typeText(randomString)
        
        let addTextAndSendButton = app.buttons["Add Text and Send"]
        addTextAndSendButton.tap()
        addTextAndSendButton.tap()
        app.buttons["Add Text and Pop"].tap()
        
        addTextAndSendButton.tap()
        
        // TODO: get added text from VC
        let match = randomString + " 😅 🤔 😘 😅"
        XCTAssertTrue(app.staticTexts[match].exists)
    }
}
