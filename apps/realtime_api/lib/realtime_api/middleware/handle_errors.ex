defmodule RealtimeAPI.Middleware.HandleErrors do
  @moduledoc """
  `Absinthe.Middleware` which handles error tuples from resolver functions.

  This allows resolver functions to be much simpler, because they do not
  have to handle their own errors. This is very similar to `action_fallback`
  in Phoenix.

  ## Example

      # Resolver function
      def get(%{id: id}, _context) do
        Domain.get_item(id)
      end
  """
  @behaviour Absinthe.Middleware

  defp handle_error(%{__struct__: Ecto.Changeset} = changeset) do
    {:ok, %{errors: transform_errors(changeset)}}
  end

  defp handle_error(error) do
    {:error, error}
  end

  defp transform_errors(%{__struct__: Ecto.Changeset} = changeset) do
    changeset
    |> changeset.__struct__.traverse_errors(&format_error/1)
    |> Enum.map(fn {key, value} ->
         %{key: key, message: value}
       end)
  end

  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  def call(%{errors: errors} = resolution, _opts) do
    results =
      errors
      |> Enum.map(&handle_error/1)
      |> Enum.group_by(&elem(&1, 0))

    errors = Enum.map(results[:error] || [], &unwrap!/1)
    resolution = Map.put(resolution, :errors, errors)

    Enum.reduce(results[:ok] || [], resolution, fn result, resolution ->
      Absinthe.Resolution.put_result(resolution, result)
    end)
  end

  defp unwrap!({_, value}), do: value
end
