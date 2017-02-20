import XCTest
@testable import AppTests

XCTMain([
    testCase(RoutesTests.allTests),
    testCase(PostTests.allTests),
    testCase(PostsControllerTests.allTests),
])
