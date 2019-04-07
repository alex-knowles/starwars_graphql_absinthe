defmodule StarwarsGraphqlAbsinthe.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      dialyzer: [ignore_warnings: ".dialyzer-ignore-warnings"],
      deps: deps()
    ]
  end

  defp deps do
    []
  end
end
