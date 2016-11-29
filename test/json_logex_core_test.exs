defmodule JSONLogexCoreTest do
  @moduledoc false
  use ExUnit.Case, async: true

  import JSONLogexCore
  import ExUnit.CaptureIO

  test "should generates a json output" do
    log_output = capture_io(&log_test_example/0)
    assert Poison.decode!(log_output)
  end

  test "should have the message info" do
    assert log_entry_example["message"] == "test info message"
  end

  test "should have the level info" do
    assert log_entry_example["level"] == "info"
  end

  test "should have the timestamp info with the right format" do
    assert log_entry_example["timestamp"] == "2016-11-26 11:15:33.123000"
  end

  test "should have the trace info" do
    assert log_entry_example["trace"]
  end

  test "should have the pid in the trace info" do
    assert log_entry_example["trace"]["pid"]
  end

  test "should have the module in the trace info" do
    assert log_entry_example["trace"]["module"] == "test module"
  end

  test "should have the function in the trace info" do
    assert log_entry_example["trace"]["function"] == "test function"
  end

  test "should have the line in the trace info" do
    assert log_entry_example["trace"]["line"] == 1
  end

  defp log_entry_example do
    log_output = capture_io(&log_test_example/0)
    Poison.decode!(log_output)
  end

  defp log_test_example do
    log_event(_level = :info,
              _message = "test info message",
              _timestamp = {{2016, 11, 26}, {11, 15, 33, 123}},
              _metadata = [
                pid: self(),
                application: "test application",
                module: "test module",
                function: "test function",
                file: "test file",
                line: 1
              ])
  end

end
