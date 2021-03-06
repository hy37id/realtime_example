defmodule RealtimeAPI.Schema do
  @moduledoc """
  A GraphQL schema for Realtime. For more info see:
  https://hexdocs.pm/absinthe/Absinthe.html
  """

  use Absinthe.Schema

  import_types RealtimeAPI.Types.Sample

  query do
    description """
    The following queries can be performed against this GraphQL API.
    """

    import_fields :sample_queries
  end

  subscription do
    field :new_sample, :sample do
      config(fn _args, _info ->
        {:ok, topic: "*"}
      end)
    end
  end

  # Apply the HandleErrors middleware on every query, subscription or mutation
  # so that resolver functions don't have to handle their own errors.
  #
  # This is very similar to `action_fallback` in Phoenix.
  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:query, :subscription, :mutation] do
    middleware ++ [RealtimeAPI.Middleware.HandleErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end