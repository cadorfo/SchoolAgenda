defmodule SchoolAgenda.AuthController do
  use SchoolAgenda.Web, :controller
  plug Ueberauth
  alias SchoolAgenda.User

  def callback(%{ assigns: %{ueberauth_auth: %{info: info}}} = conn, _params) do
    user = insert_user_if_not_created(info)
    conn
    |> put_session(:user_id, user.id)
    |> put_flash(:info, "User Logge in with successfully")
    |> redirect(to: "/")
  end

  defp insert_user_if_not_created(%{email: email, first_name: first_name, last_name: last_name}) do
    user_params = %{ email: email, name: "#{first_name} #{last_name}"}

    changeset = User.changeset(%User{}, user_params)
    user = Repo.get_by(User, email: email)
    if !user do
      Repo.insert(changeset)
    end
    IO.inspect user  
    user
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

end
