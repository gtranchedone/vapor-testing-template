import Vapor
import App

let drop = Droplet()
let configuration = Configuration(viewRenderer: drop.view,
                                  localization: drop.localization)
configureRoutes(router: drop, configuration: configuration)

drop.run()
