defmodule RealtimeAPI.Resolvers.Sample do
  @moduledoc """
  A sample GraphQL resolver.
  """

  @samples %{
    "1" => %{name: "John Smith"},
    "2" => %{name: "Jane Smith"}
  }

  # Resolver functions should call into Realtime's domain modules
  # to fetch data. Do not use Realtime.Repo.
  #
  # See `RealtimeAPI.Batch.batch_on/2`.
  def sample(%{id: id}, %{context: _context}) do
    {:ok, @samples[id]}
  end
end
