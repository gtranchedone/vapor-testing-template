import HTTP
import Routing
import Vapor

public struct Configuration {
    public let viewRenderer: Vapor.ViewRenderer
    public let localization: Vapor.Localization
    
    public init(viewRenderer: Vapor.ViewRenderer,
                localization: Vapor.Localization) {
        self.viewRenderer = viewRenderer
        self.localization = localization
    }
}

public func configureRoutes<T : Routing.RouteBuilder>(router: T, configuration: Configuration) where T.Value == HTTP.Responder {
    let renderer = configuration.viewRenderer
    let localization = configuration.localization

    router.get { request in
        return try renderer.make("welcome", [
            "message": localization[request.lang, "welcome", "title"]
        ])
    }
    router.resource("posts", PostsController())
}
