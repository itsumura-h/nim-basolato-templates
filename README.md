Basolato Framework templates
===

This repository is project boilerplate templates

```
├── app
│   ├── data_stores
│   │   ├── queries
│   │   └── repositories
│   ├── di_container.nim
│   ├── http
│   │   ├── controllers
│   │   │   └── welcome_controller.nim
│   │   ├── middlewares
│   │   │   ├── auth_middleware.nim
│   │   │   └── cors_middleware.nim
│   │   └── views
│   │       ├── errors
│   │       ├── layouts
│   │       │   ├── application_view.nim
│   │       │   └── head_view.nim
│   │       └── pages
│   │           └── welcome_view.nim
│   ├── models
│   └── usecases
├── config
│   └── database.nim
├── config.nims
├── database
│   ├── migrations
│   │   └── migrate.nim
│   └── seeders
│       └── seed.nim
├── main.nim
├── public
│   ├── basolato.svg
│   ├── css
│   ├── favicon.ico
│   └── js
├── resources
│   └── lang
│       ├── en
│       │   └── validation.json
│       └── ja
│           └── validation.json
├── project.nimble
└── tests
    └── test_project.nim
```
create manually
- config.nims
- tests
- public/js/
- public/css/
