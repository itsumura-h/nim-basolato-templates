# framework
import basolato
# controller
import app/http/controllers/welcome_controller
# middleware
import app/http/middlewares/auth_middleware
import app/http/middlewares/cors_middleware


let ROUTES = @[
  Route.group("", @[
    Route.get("/", welcome_controller.index),

    Route.group("/api", @[
      Route.get("/index", welcome_controller.indexApi),
    ])
    .middleware(cors_middleware.setCorsHeadersMiddleware),
  ])
  .middleware(auth_middleware.checkCsrfTokenMiddleware),
]

serve(ROUTES)
