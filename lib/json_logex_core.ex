defmodule JSONLogexCore do
  @moduledoc false

  def configure(options) do
    options
  end

  def log_event(level, message, timestamp, metadata) do
    IO.puts event_json(level, message, timestamp, metadata)
  end

  def event_json(level, message, timestamp, metadata) do
    Poison.encode! %{
      level: level,
      timestamp: timestamp_to_string(timestamp),
      message: to_string(message),
      trace: %{
        pid: pid_to_string(metadata[:pid]),
        module: metadata[:module],
        function: metadata[:function],
        line: metadata[:line]
      }
    }
  end

  defp pid_to_string(pid) do
    to_string(:io_lib.fwrite('~p', [pid]))
  end

  defp timestamp_to_string({date, {hour, min, sec, millisec}}) do
    timestamp = NaiveDateTime.from_erl!({date, {hour, min, sec}}, millisec * 1000)
    NaiveDateTime.to_string(timestamp)
  end

end
