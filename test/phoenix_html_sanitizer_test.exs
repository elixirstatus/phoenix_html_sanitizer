defmodule PhoenixHtmlSanitizerViewTest do
  use ExUnit.Case

  use PhoenixHtmlSanitizer, :basic_html

  test "raw text" do
    assert sanitize("test!") == {:safe, "test!"}
  end

  test "tag not supported by chosen default mode" do
    assert sanitize("<header>test!</header>") == {:safe, "test!"}
  end

  test "using a different sanitizer mode" do
    assert sanitize("<header>test!</header>", :full_html) == {:safe, "<header>test!</header>"}
  end
end
