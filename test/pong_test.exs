defmodule PongTest do
  use ExUnit.Case

  test "it responds to a ping with a pong" do
    pid = spawn_link(Pong, :start, [])
    send(pid, {self(), :pong})
    assert_receive {pid, :ping}
  end

  test "it responds to two pongs" do
    pid = spawn_link(Pong, :start, [])

    send pid, {self(), :pong}
    assert_receive {pid, :ping}

    send pid, {self(), :pong}
    assert_receive {pid, :ping}
  end
end
