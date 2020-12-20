# framework
import basolato
# controller
import app/controllers/welcome_controller
# middleware
import app/middlewares/auth_middleware

var routes = newRoutes()
routes.middleware(".*", auth_middleware.checkCsrfTokenMiddleware)
routes.get("/", welcome_controller.index)

serve(routes)
