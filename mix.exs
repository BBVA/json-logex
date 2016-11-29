defmodule JSONLogex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :json_logex,
      description: description(),
      package: [
        maintainers: ["innotech@bbva.com"],
        licenses: ["Apache 2.0", "Copyright © 2016 BBVA"],
        links: %{"GitHub" => "https://github.com/BBVA/json-logex.git"},
      ],
      version: "0.1.0",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_),     do: ["lib"]

  defp description do
    """
    JSONLogex is a custom backend for Elixir's Logger.
    It outputs log events in JSON format to the standard console.
    """
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "0.5.3", only: [:dev, :test]},
      {:poison, "3.0.0"}
    ]
  end

end
