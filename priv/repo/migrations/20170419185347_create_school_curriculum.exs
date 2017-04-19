defmodule SchoolAgenda.Repo.Migrations.CreateSchoolCurriculum do
  use Ecto.Migration

  def change do
    create table(:school_curriculums) do
      add :title, :string

      timestamps()
    end

  end
end
