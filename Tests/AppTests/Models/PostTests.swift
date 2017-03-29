import XCTest
@testable import App

class PostTests: VaporTestCase {
    
    static let allTests = [
        ("testExample", testExample),
        ("testExampleThatThrows", testExampleThatThrows)
    ]
    
    func testExample() {
        XCTAssertTrue(true)
    }
    
    func testExampleThatThrows() throws {
        perform {
            XCTAssertTrue(true)
        }
    }
    
}
