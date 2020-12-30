import re
# framework
import basolato
# controller
import app/controllers/welcome_controller
# middleware
import app/middlewares/auth_middleware

var routes = newRoutes()
routes.middleware(re".*", auth_middleware.checkCsrfTokenMiddleware)
routes.middleware(@[HttpOptions], re"/api/.*", cors_middleware.setCorsHeadersMiddleware)

routes.get("/", welcome_controller.index)

serve(routes)
