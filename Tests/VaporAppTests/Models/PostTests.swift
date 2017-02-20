import Vapor
import XCTest

@testable import VaporApp

class PostTests: XCTestCase {
    
    static var allTests : [(String, (PostTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
    
    func testExample() throws {
        XCTAssertTrue(true)
    }
    
}
