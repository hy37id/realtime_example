defmodule RealtimeAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :realtime_api,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      docs: docs(),
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {RealtimeAPI.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp docs do
    [
      main: RealtimeAPI
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:realtime, in_umbrella: true},
      {:absinthe_plug, "~> 1.4.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
