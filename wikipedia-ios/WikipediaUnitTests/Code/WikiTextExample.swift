// ~~~**DELETE THIS HEADER**~~~

import Foundation
import XCTest

class WikiTextExample: XCTestCase {
    
    func testPopularExample() throws {
        let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
        app.launch()
        UserDefaults.standard.set(true, forKey: "DidShowOnboarding5.3")
        
        let collectionViewQuery = app.collectionViews
        
        collectionViewQuery.staticTexts ["Самые читаемые"].tap()
        XCTAssertTrue(app.staticTexts["Самые читаемые"].firstMatch.exists)
    }
    
    func testSettingsExample() throws {
        let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
        app.launch()
        UserDefaults.standard.set(true, forKey: "DidShowOnboarding5.3")
        
        app.buttons ["Настройки"].tap()
        app.staticTexts ["О приложении"].tap()
        
        let about = app.staticTexts["Авторы"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: about, handler: nil)

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(about.exists)

        XCTAssert(app.staticTexts["Авторы"].exists)
        XCTAssert(app.staticTexts["Переводчики"].exists)
        XCTAssert(app.staticTexts["Лицензия содержимого"].exists)
    }
}
