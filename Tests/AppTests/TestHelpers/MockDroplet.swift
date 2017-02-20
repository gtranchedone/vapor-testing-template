import HTTP
import Routing
import Vapor

class MockDroplet: Routing.RouteBuilder {
    
    private var routes = [String : Any]()
    
    func add(path: [String], value: Responder) {
        let route = path.joined(separator: "/")
        routes["/\(route)"] = value
    }
    
    func respond(to request: Request) throws -> Response {
        let path = String(describing: request.uri)
        guard let responder = routes[path] as? Responder else {
            throw Abort.notFound
        }
        return try responder.respond(to: request)
    }
    
}
