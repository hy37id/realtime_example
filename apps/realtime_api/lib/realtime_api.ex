defmodule RealtimeAPI do
  @moduledoc """
  A GraphQL API implemented with `Absinthe` and `AbsinthePlug`. 

  It provides the following modules which can easily integrate with Phoenix or any other
  Plug-based HTTP endpoint.

  - `RealtimeAPI.Schema`: A pluggable GraphQL schema defining this
    API's GraphQL types, queries, and mutations.

  - `Absinthe.Plug.GraphiQL`: A GraphiQL plug which can be used to serve GraphiQL at any
    url path of your choosing.

  ## Examples

  It's easy to use `RealtimeAPI.Schema` with a Phoenix router:

      pipeline :api do
        plug :accepts, ["json"]
      end

      scope "/" do
        pipe_through :api

        forward "/api", Absinthe.Plug, schema: RealtimeAPI.Schema
        forward "/graphiql", Absinthe.Plug.GraphiQL, schema: RealtimeAPI.Schema
      end

  Also, if `RealtimeAPI` is set up to load a complex object
  graph, you can query it directly from your web framework using `run/2`.

      {:ok, %{data: %{"some_query" => %{"field" => value}}}} =
        RealtimeAPI.run(
          \"\"\"
          query some_query($id: ID!) {
            some_query(id: $id) {
              field
            }
          }
          \"\"\",
          variables: %{
            "id" => 123
          }
        )
  """

  @doc """
  Shortcut function to execute a GraphQL query against `RealtimeAPI.Schema`.

  ## Example

      {:ok, %{data: %{"some_query" => %{"field" => value}}}} =
        Realtime.run(
          \"\"\"
          query some_query($id: ID!) {
            some_query(id: $id) {
              field
            }
          }
          \"\"\",
          variables: %{
            "id" => 123
          }
        )
  """
  @spec run(String.t(), Absinthe.run_opts()) :: Absinthe.run_result()
  def run(query, opts \\ []) do
    Absinthe.run(query, RealtimeAPI.Schema, opts)
  end
end
