import HTTP
import XCTest
@testable import App
@testable import Vapor

class RoutesTests: VaporTestCase {
    
    static let allTests = [
        ("testRouteToHomepage", testRouteToHomepage)
    ]
    
    func testRouteToHomepage() throws {
        perform {
            let request = try Request(method: .get, uri: "/")
            let response = try droplet.respond(to: request)
            let expectedResponse = try droplet.view.make("welcome", [
                "message": droplet.localization[request.lang, "welcome", "title"]
            ]).makeResponse()
            XCTAssertEqual("\(response.body)", "\(expectedResponse.body)")
            XCTAssertEqual(response.status, Status.ok)
        }
    }
    
}
