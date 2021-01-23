Migrations
===
Migrations are Database table difinition and seeder.

migration{datetime}{table_name}.nim
```nim
import json, strformat, os
import allographer/schema_builder
import allographer/query_builder

proc migration0001sample*() =
  # Create table schema
  schema([
    table("sample_users", [
      Column().increments("id"),
      Column().string("name"),
      Column().string("email")
    ])
  ])

  if getEnv("ENV") == "dev":
    # Seeder
    var users: seq[JsonNode]
    for i in 1..10:
      users.add(%*{
        "id": i,
        "name": &"user{i}",
        "email": &"user{i}@nim.com"
      })
    RDB().table("sample_users").insert(users)
```

migrate.nim
```
import migration0001sample

proc main() =
  migration0001sample()

main()
```
