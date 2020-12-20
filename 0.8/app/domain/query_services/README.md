Query Service
===

`Query Service` is a type of procs that access database or API to **fetch** data.  
This design is based on [Command–query_separation](https://en.wikipedia.org/wiki/Command–query_separation)

`Repository` is created in correspondence with the `aggregation`. However, `query service` is independent of aggregation and includes all data acquisition processes.

## sample
### Usecase
```nim
import json
import ../models/value_objects
import ../models/post/post_repository_interface
import ../query_services/query_service_interface

type PostUsecase* = ref object
  repository: IPostRepository
  queryService: IQueryService

proc newPostUsecase*():PostUsecase =
  return PostUsecase()

proc index*(this:PostUsecase, userId:int):seq[JsonNode] =
  let userId = newUserId(userId)
  return this.queryService.getPosts(userId)

proc show*(this:PostUsecase, id:int):JsonNode =
  let postId = newPostId(id)
  return this.queryService.getPost(postId)
```

### Query service interface
```nim
import json
# include ../di_container
import rdb_query_service
import ../models/value_objects

type IQueryService* = ref object
  ctx: RdbQueryService

proc newIQueryService*():IQueryService =
  return newIQueryService()

proc getPosts*(this:IQueryService, userId:UserId):seq[JsonNode] =
  return this.ctx.getPosts(userId)

proc getPost*(this:IQueryService, postId:PostId):JsonNode =
  return this.ctx.getPost(postId)
```

### Query service
```nim
import json
import allographer/query_builder
import ../models/value_objects

type RdbQueryService* = ref object

proc newRdbQueryService*(): RdbQueryService =
  return RdbQueryService()

proc getUser*(this:RdbQueryService, email:UserEmail):JsonNode =
  return rdb().table("users").where("email", "=", email.get).first()

proc getPosts*(this:RdbQueryService, userId:UserId):seq[JsonNode] =
  return rdb().table("posts")
        .select("posts.id", "title", "content", "is_finished")
        .join("users", "users.id", "=", "posts.user_id")
        .where("users.id", "=", userId.get)
        .get()

proc getPost*(this:RdbQueryService, id:PostId):JsonNode =
  return rdb().table("posts").find(id.get)
```