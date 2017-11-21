# RealtimeAPI

A GraphQL API for Realtime, based on [Absinthe](http://absinthe-graphql.org).

`RealtimeWeb.Router` mounts the API schema for HTTP clients.

## Rules

- RealtimeAPI is a _client_ of Realtime. Only call Realtime's public interface.
- Do not use `absinthe_ecto`. Instead, load associations using `RealtimeAPI.Schema.Assoc.assoc/2`.
