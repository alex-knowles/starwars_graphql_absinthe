defmodule Web.MixProject do
  use Mix.Project

  def project do
    [
      app: :web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      dialyzer: [ignore_warnings: "../../.dialyzer-ignore-warnings"],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [all_checks: :test]
    ]
  end

  def application do
    [
      mod: {Web.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:absinthe, "~> 1.4.2"},
      {:absinthe_plug, "~> 1.4.0"},
      {:absinthe_phoenix, "~> 1.4.0"},
      {:core, in_umbrella: true},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.4.3"},
      {:phoenix_pubsub, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      all_checks: [
        "compile --force --warnings-as-errors",
        "credo --strict",
        "format --check-formatted",
        "test",
        "dialyzer"
      ]
    ]
  end
end
