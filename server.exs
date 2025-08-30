# just a f'ing simple http server
Mix.install([
  {:plug_cowboy, "~> 2.7"}
])

defmodule SimpleServer do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello, Elixir!")
  end

  get "/hello/:name" do
    send_resp(conn, 200, "Hello, #{name}!")
  end

  match _ do
    send_resp(conn, 404, "Oops! Page not found")
  end
end

# lets go
{:ok, _pid} = Plug.Cowboy.http(SimpleServer, [], port: 4000)

IO.puts("Server running on http://localhost:4000")

# gotta keep this shit runnign lol
:timer.sleep(:infinity)
