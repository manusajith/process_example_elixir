defmodule PingTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    pid = spawn_link(Ping, :start, [])
    send(pid, {self(), :ping})
    assert_receive {pid, :pong}
  end

  test "it responds to two pongs" do
    pid = spawn_link(Ping, :start, [])

    send pid, {self(), :ping}
    assert_receive {pid, :pong}

    send pid, {self(), :ping}
    assert_receive {pid, :pong}
  end
end
