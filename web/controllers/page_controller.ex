defmodule FabricaDeBolo.PageController do
  use FabricaDeBolo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
