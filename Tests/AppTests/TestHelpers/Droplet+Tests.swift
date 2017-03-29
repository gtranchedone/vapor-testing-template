@testable import Vapor
@testable import Console

extension Droplet {
    
    static func dropletForTests() throws -> Droplet {
        let droplet = Droplet(arguments: ["dummy/path/", "prepare", "-y"],
                              environment: .test)
        return droplet
    }
    
    func setUp() throws {
        try runCommands()
    }
    
    func tearDown() throws {
        let p = Prepare(console: console,
                        preparations: preparations,
                        database: database)
        try p.run(arguments: ["--revert"])
    }
    
}
