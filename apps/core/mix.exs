defmodule Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :core,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      dialyzer: [ignore_warnings: "../../.dialyzer-ignore-warnings"],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [all_checks: :test]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Core.Application, []}
    ]
  end

  defp deps do
    [
      {:dataloader, "~> 1.0",
       git: "git@github.com:absinthe-graphql/dataloader.git", ref: "4c4d53610aeca7561636ba6c97f1c5f633462ed4"}
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
