[
  inputs: [
    "apps/*/{lib,config,test}/**/*.{ex,exs}",
    "apps/*/mix.exs"
  ],
  locals_without_parens: [
    # GraphQL
    description: 1,
    import_fields: 1,
    import_types: 1,
    field: 2,
    arg: 2,
    resolve: 1,
    
    # Phoenix
    plug: 2,
    plug: 1,
    pipe_through: 1,
    get: 3,
    post: 3,
    patch: 3,
    put: 3,
    forward: 3
  ]
]