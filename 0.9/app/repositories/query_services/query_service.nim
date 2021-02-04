import json
import ../../http/query_service_interface
import ../models/value_objects
import allographer/query_builder


type QueryService* = ref object

proc newQueryService*(): QueryService =
  return QueryService()


proc toInterface*(this:QueryService):IQueryService =
  return ()
