defmodule Phoenix.HTML.Sanitizer.Helpers do
  @moduledoc """
  Helpers related to sanitizing user input that may contain HTML elements.
  """

  def sanitize(nil, _), do: ""

  def sanitize(text, :basic_html) do
    text
      |> HtmlSanitizeEx.basic_html
      |> Phoenix.HTML.raw
  end

  def sanitize(text, :full_html) do
    text
      |> HtmlSanitizeEx.html5
      |> Phoenix.HTML.raw
  end

  def sanitize(text, :strip_tags) do
    text
      |> HtmlSanitizeEx.strip_tags
      |> Phoenix.HTML.raw
  end

  def strip_tags(text), do: sanitize(text, :strip_tags)
end
