defmodule RaniulatorWeb.PageController do
  use RaniulatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
