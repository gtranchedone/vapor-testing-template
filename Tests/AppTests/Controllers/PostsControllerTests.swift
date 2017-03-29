import XCTest
@testable import App

class PostsControllerTests: VaporTestCase {
    
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
