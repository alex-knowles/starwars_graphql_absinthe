defmodule StarwarsGraphqlAbsinthe.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      dialyzer: [ignore_warnings: ".dialyzer-ignore-warnings"],
      aliases: aliases(),
      deps: deps(),
      preferred_cli_env: [all_checks: :test]
    ]
  end

  defp deps do
    []
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
