defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def callback(conn, params) do
    IO.puts "+++++++++++++++++++"
    IO.inspect(conn.assigns)
    IO.puts "+++++++++++++++++++"
    IO.inspect(params)
    IO.puts "+++++++++++++++++++"
  end
end
