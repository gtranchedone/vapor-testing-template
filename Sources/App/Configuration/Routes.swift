import Auth
import HTTP
import Vapor

public func configure(droplet: Droplet) throws {
    try configureMiddlewares(with: droplet)
    try configureDatabase(with: droplet)
    try configureRoutes(with : droplet)
}

private func configureDatabase(with droplet: Droplet) throws {
    /* e.g.
    try droplet.addProvider(VaporPostgreSQL.Provider.self)
    droplet.preparations.append(Post.self)
    */
}

private func configureMiddlewares(with droplet: Droplet) throws {
    /* e.g.
    droplet.middleware.append(AuthMiddleware<User>())
    */
}

private func configureRoutes(with droplet: Droplet) throws {
    droplet.get { request in
        return try droplet.view.make("welcome", [
            "message": droplet.localization[request.lang, "welcome", "title"]
        ])
    }
    droplet.resource("posts", PostsController())
}
