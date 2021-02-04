# query service
import http/query_service_interface
import model/repositories/query_services/query_service

type DiContainer* = tuple
  queryService: IQueryService

proc newDiContainer():DiContainer =
  return (
    queryService: newQueryService().toInterface(),
  )

let di* = newDiContainer()
