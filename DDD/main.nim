# framework
import basolato/routing
# middleware
import app/middlewares/custom_headers_middleware
import app/middlewares/framework_middleware
# controller
import app/controllers/welcome_controller

routes:
  # Framework
  error Http404: http404Route
  error Exception: exceptionRoute
  before: framework

  get "/":
    route(newWelcomeController(request).index(),[corsHeader(), secureHeader()])

# proc main() =
#   let port = 5000.Port
#   let settings = newSettings(port=port)
#   var jester = initJester(main_router, settings=settings)
#   jester.serve()

# when isMainModule:
#   main()
