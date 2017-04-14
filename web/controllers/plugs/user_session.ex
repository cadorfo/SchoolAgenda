defmodule SchoolAgenda.Plugs.UserSession do
  import Plug.Conn
  alias SchoolAgenda.User
  alias SchoolAgenda.Repo

  def init(options), do: options

  def call(conn, _opts) do
    id = conn |> get_session(:user_id)
    if id do
      conn = login_user(conn,id)
    end
    conn
  end

  def login_user(conn, user_id) do
    user = Repo.get!(User, user_id)
    conn
    |> assign(:current_user, user)
  end

end
