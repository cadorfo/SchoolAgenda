defmodule SchoolAgenda.PageController do
  use SchoolAgenda.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
