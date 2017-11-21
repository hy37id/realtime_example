defmodule Realtime.Repo do
  # This Repo is private to Realtime and MUST NOT be used
  # outside this application. (Including in tests) Use the public
  # API of the domains instead.

  @moduledoc false

  use Ecto.Repo, otp_app: :realtime

  @doc """
  Dynamically loads the repository url from the DATABASE_URL environment 
  variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
