defmodule RealtimeAPI.DataCase do
  @moduledoc """
  An ExUnit.CaseTemplate which starts up `Realtime.Repo` properly
  so that tests can be run which call it.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import RealtimeAPI, only: [run: 1, run: 2]
      import RealtimeAPI.DataCase
      import RealtimeAPI.Factories.Query
      import RealtimeAPI.Factories.Mutation
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Realtime.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Realtime.Repo, {:shared, self()})
    end

    :ok
  end

  @doc """
  Asserts that an invalid token response was returned.

  ## Example

      query
      |> run(...)
      |> assert_invalid_token()
  """
  @spec assert_invalid_token(Absinthe.run_result()) :: no_return
  def assert_invalid_token({:ok, %{data: data, errors: [error | _]}}) do
    assert Enum.all?(data, fn {_key, val} -> is_nil(val) end)
    assert error[:message] =~ "token is invalid"
  end
end
