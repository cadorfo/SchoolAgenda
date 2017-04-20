defmodule SchoolAgenda.Plugs.AuthPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(options), do: options

  def call(conn, _options) do
    id = conn |> get_session(:user_id)
    if !id do
      do_redirect(conn, "/login")
    end
    conn
  end

  defp do_redirect(conn, to) do
   conn
     |> redirect(to: to)
     |> halt
 end
end
