defmodule SchoolAgenda.Repo.Migrations.CreateCurriculumRequirement do
  use Ecto.Migration

  def change do
    create table(:curriculum_requirements) do
      add :school_curriculum_id, references(:school_curriculums, on_delete: :delete_all)
      add :discipline_id, references(:disciplines, on_delete: :nothing)
      add :classes_number, :integer

      timestamps()
    end
    create index(:curriculum_requirements, [:school_curriculum_id])
    create index(:curriculum_requirements, [:discipline_id])

  end
end
