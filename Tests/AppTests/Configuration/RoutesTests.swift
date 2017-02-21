import HTTP
import XCTest

@testable import Vapor
@testable import App

class RoutesTests: XCTestCase {
    
    static var allTests : [(String, (RoutesTests) -> () throws -> Void)] {
        return [
            ("testRouteToHomepage", testRouteToHomepage),
        ]
    }
    
    private var configuration: Configuration!
    private var mockDroplet: MockDroplet!
    
    override func setUp() {
        super.setUp()
        mockDroplet = MockDroplet()
        let rootDirectory = Droplet.workingDirectory(from: [])
        let viewsDir = rootDirectory + "/Resources/Views"
        let viewRenderer = LeafRenderer(viewsDir: viewsDir)
        let localizationDirectory = rootDirectory + "/Localization"
        let localization = try! Localization(localizationDirectory: localizationDirectory)
        configuration = Configuration(viewRenderer: viewRenderer, localization: localization)
        configureRoutes(router: mockDroplet, configuration: configuration)
    }
    
    func testRouteToHomepage() throws {
        let request = try Request(method: .get,
                                  uri: "*/GET",
                                  headers: ["Accept-Language": "en-US"])
        let response = try mockDroplet.respond(to: request)
        let expectedResponse = try configuration.viewRenderer.make("welcome", [
            "message": configuration.localization[request.lang, "welcome", "title"]
        ]).makeResponse()
        XCTAssertEqual("\(response)", "\(expectedResponse)")
    }
    
}
