import json
import allographer/query_builder
import ../models/value_objects

type RdbQueryService* = ref object


proc newRdbQueryService*(): RdbQueryService =
  return RdbQueryService()

proc sampleProc*(this:RdbQueryService) =
  echo "RdbQueryService sampleProc"
