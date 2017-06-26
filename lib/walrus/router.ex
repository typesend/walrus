defmodule Walrus.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> send_resp(200, "Walrus")
  end

  def start_link do
    Plug.Adapters.Cowboy.http(Walrus.Router, [])
  end
end
