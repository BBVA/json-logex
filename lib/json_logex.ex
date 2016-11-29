defmodule JSONLogex do
  @moduledoc false
  use GenEvent
  import JSONLogexCore

  def init(__MODULE__) do
    {:ok, configure([])}
  end

  def handle_call({:configure, options}, _state) do
    {:ok, :ok, configure(options)}
  end

  @doc """
  Ignore messages where the group leader is in a different node.
  """
  def handle_event({_level, global_leader, _event}, state) when node(global_leader) != node() do
    {:ok, state}
  end

  @doc """
  Handles an log event. It process every log event sent by Logger (which previously filters depending on the level).
  """
  def handle_event({level, _global_leader, {Logger, message, timestamp, metadata}}, state) do
    log_event(level, message, timestamp, metadata)
    {:ok, state}
  end

  @doc """
  Handles and ignores other events.
  """
  def handle_event(_, state) do
    {:ok, state}
  end

end
