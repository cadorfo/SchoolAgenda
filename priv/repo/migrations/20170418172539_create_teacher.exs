defmodule SchoolAgenda.Repo.Migrations.CreateTeacher do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
