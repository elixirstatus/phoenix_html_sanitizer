# Phoenix HTML Sanitizer [![Deps Status](https://beta.hexfaktor.org/badge/all/github/elixirstatus/phoenix_html_sanitizer.svg)](https://beta.hexfaktor.org/github/elixirstatus/phoenix_html_sanitizer) [![Inline docs](http://inch-ci.org/github/elixirstatus/phoenix_html_sanitizer.svg)](http://inch-ci.org/github/elixirstatus/phoenix_html_sanitizer)

`phoenix_html_sanitizer` provides a simple way to sanitize user input in your Phoenix app.

It is extracted from the [elixirstatus.com](http://elixirstatus.com) project, where it is used to sanitize user annoucements from around the Elixir community.



## What can it do?

`phoenix_html_sanitizer` parses a given HTML string and either completely strips it from HTML tags or sanitizes it by only allowing certain HTML elements and attributes to be present. It depends on [html_sanitize_ex](http://github.com/rrrene/html_sanitize_ex) to do this.


## Installation

Add phoenix_html_sanitizer as a dependency in your `mix.exs` file.

```elixir
defp deps do
  [
    # ...
    {:phoenix_html_sanitizer, "~> 1.1"}
  ]
end
```

After you are done, run `mix deps.get` in your shell.

To include the Sanitizer into all your views, you can add it to your `web.ex`
file:

```elixir
    def view do
      quote do
        use Phoenix.View, root: "web/templates"

        [snip]

        # Use all HTML functionality (forms, tags, etc)
        import Phoenix.HTML
        import Phoenix.HTML.Form
        use PhoenixHTMLHelpers
        use PhoenixHtmlSanitizer, :basic_html         <-------- add this line
      end
    end
```

You have to set one of three base modes here:

* `:strip_tags` - all tags are stripped from the input.
* `:basic_html` - some basic HTML tags are allowed. This is great for allowing basic usages of HTML for sites like online forums and it works great in combination with a Markdown parser.
* `:full_html` - all HTML5 tags are allowed and sanitized.

After you included `PhoenixHtmlSanitizer` into your `web.ex`, it will provide
two functions in your views:

* `sanitize/1` uses the defined base mode,
* `sanitize/2` takes the mode as second parameter.



## Usage in views

`sanitize` can strip all tags from the given string:

```elixir
    text = "<a href=\"javascript:alert('XSS');\">text here</a>"
    sanitize(text, :strips_tags)
    # => {:safe, "text here"}
```

Or allow certain basic HTML elements to remain:

```elixir
    text = "<h1>Hello <script>World!</script></h1>"
    sanitize(text, :basic_html)
    # => {:safe, "<h1>Hello World!</h1>"}
```

```elixir
    text = "<header>Hello <script>World!</script></header>"
    sanitize(text, :full_html)
    # => {:safe, "<header>Hello World!</header>"}
```

Notice how the output follows the Phoenix.HTML.Safe protocol.

Thus both `sanitize/1` and `sanitize/2` can be used directly in your views:

    <%= sanitize "<h1>Hello <script>World!</script></h1>" %>

This prints `<h1>Hello World!</h1>` into your `eex` template.



## Contributing

1. [Fork it!](http://github.com/elixirstatus/phoenix_html_sanitizer/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



## Author

René Föhring (@rrrene)



## License

phoenix_html_sanitizer is released under the MIT License. See the LICENSE file
for further details.
