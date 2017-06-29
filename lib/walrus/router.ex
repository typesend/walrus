defmodule Walrus.Router do
  use Plug.Router

  plug Plug.RequestId
  plug Plug.Logger

  # Objects

  get "/buckets/:bucket/keys/:key" do
    conn |> send_resp(200, "GET #{bucket} / #{key}")
  end

  put "/buckets/:bucket/keys/:key" do
    conn |> send_resp(200, "PUT #{bucket} / #{key}")
  end

  post "/buckets/:bucket/keys/:key" do
    conn |> send_resp(200, "POST #{bucket} / #{key}")
  end

  post "/buckets/:bucket/keys" do
    conn |> send_resp(200, "POST #{bucket} / (to-be-named)")
  end

  delete "/buckets/:bucket/keys/:key" do
    conn |> send_resp(200, "DELETE #{bucket} / #{key}")
  end

  # Information

  get "/ping" do
    conn |> send_resp(200, "pong")
  end

  get "/stats" do
    conn |> send_resp(200, "GET /stats")
  end

  get "/" do
    version = Walrus.Mixfile.project[:version]
    conn |> send_resp(200, "Walrus #{version}")
  end

  get "/buckets" do
    conn |> send_resp(200, "list buckets")
  end

  get "/buckets/:bucket/keys" do
    conn |> send_resp(200, "list keys in #{bucket}")
  end

  plug :match
  plug :dispatch

  match _ do
    send_resp(conn, 404, "404 Not Found")
  end
end
