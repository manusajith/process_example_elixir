defmodule Pong do
  def start do
    receive do
      {pid, :pong} ->
        send pid, {self(), :ping}
    end
    start
  end
end
