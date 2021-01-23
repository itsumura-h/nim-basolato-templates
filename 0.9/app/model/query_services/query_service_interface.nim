import json
# include ../di_container
import ../../repositories/query_services/rdb_query_service
import ../value_objects

type IQueryService* = ref object
  ctx: RdbQueryService


proc newIQueryService*():IQueryService =
  return newIQueryService()

proc sampleProc*(this:IQueryService) =
  this.ctx.sampleProc()
