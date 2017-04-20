defmodule SchoolAgenda.Plugs.AuthPlug do
  import Plug.Conn
  def init(options), do: options

  def call(conn, _options) do
    id = conn |> get_session(:user_id)
    if id do
      
    end
    conn
  end
end
