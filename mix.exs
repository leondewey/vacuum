defmodule Vacuum.Mixfile do
  use Mix.Project

  def project do
    [app: :vacuum,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [ applications: (Mix.env == :dev && [:exsync] || []) ++ [:logger, :maru] ]
  end

  defp deps do
    [
      { :maru, "~> 0.10" },
      { :exsync, "~> 0.1", only: :dev }
    ]
  end
end
