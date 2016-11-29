# JSONLogex

JSONLogex is a custom backend for Elixir's Logger. It outputs log events in JSON format to the standard console.

It is based on the Logger's standard console backend, json_logger and ExSyslog. We are planning to add configuration options for custom json output and metadata.

https://hex.pm/packages/json_logex

## Installation

  1. Add `json_logex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:json_logex, "~> 0.1.0"}]
    end
    ```

  2. Use `json_logex` as a backend for logger in your config files (there is no specific configuration for this version of the backend):

  ```elixir
  config :logger,
    backends: [JSONLogex],
    utc_log: true,
    level: :debug
  ```
