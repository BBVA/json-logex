defmodule JSONLogexTest do
  @moduledoc false
  use ExUnit.Case, async: true
  require Logger
  # import ExUnit.CaptureLog

  setup do
    on_exit fn ->
      :ok = Logger.configure_backend(JSONLogex, [])
    end
  end

  test "the log ouput should be a json" do
    # TODO: capture_log only gets the standard console logs !!! Why??
    # log_output = capture_log(fn ->
    #   Logger.debug("this is a test")
    # end)
    # assert Poison.decode!(log_output)
  end

end
