defmodule PhoenixHtmlSanitizer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_html_sanitizer,
      version: "1.1.1",
      elixir: "~> 1.15",
      description: "HTML sanitizer for Phoenix",
      source_url: "https://github.com/elixirstatus/phoenix_html_sanitizer",
      package: [
        maintainers: ["René Föhring"],
        licenses: ["MIT"],
        links: %{
          "GitHub" => "https://github.com/elixirstatus/phoenix_html_sanitizer"
        }
      ],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [extra_applications: [:logger, :html_sanitize_ex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:phoenix_html, "~> 3.3 or ~> 4.1"},
      {:html_sanitize_ex, "~> 1.4"},
      {:inch_ex, ">= 0.0.0", only: :docs}
    ]
  end
end
