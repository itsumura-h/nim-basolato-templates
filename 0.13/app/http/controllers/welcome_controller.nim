import
  std/json,
  # framework
  basolato/controller,
  basolato/core/base,
  # view
  ../views/pages/welcome_view


proc index*(context:Context, params:Params):Future[Response] {.async.} =
  let name = "Basolato " & BasolatoVersion
  return render(welcomeView(name))

proc indexApi*(context:Context, params:Params):Future[Response] {.async.} =
  return render(%*{"message": "Basolato " & BasolatoVersion})
