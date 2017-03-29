import Vapor
import App

let drop = Droplet()
try App.configure(droplet: drop)
drop.run()
