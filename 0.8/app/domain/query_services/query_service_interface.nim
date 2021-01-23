import json
# include ../di_container
import rdb_query_service
import ../models/value_objects

type IQueryService* = ref object
  ctx: RdbQueryService


proc newIQueryService*():IQueryService =
  return newIQueryService()

proc sampleProc*(this:IQueryService) =
  this.ctx.sampleProc()
