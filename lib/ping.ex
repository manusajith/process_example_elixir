defmodule Ping do
  def start do
    receive do
      {pid, :ping} ->
        send pid, {self(), :pong}
    end
    start
  end
end
