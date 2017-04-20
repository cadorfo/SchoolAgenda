defmodule SchoolAgenda.PageController do
  use SchoolAgenda.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", layout: {SchoolAgenda.LayoutView, "welcome.html"}
  end
end
