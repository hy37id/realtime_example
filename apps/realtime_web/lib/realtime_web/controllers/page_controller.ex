defmodule RealtimeWeb.PageController do
  @moduledoc false

  use RealtimeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
