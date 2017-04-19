defmodule SchoolAgenda.CurriculumRequirement do
  use SchoolAgenda.Web, :model

  schema "curriculum_requirements" do
    belongs_to :school_curriculum, SchoolAgenda.SchoolCurriculum
    belongs_to :discipline, SchoolAgenda.Discipline
    field :classes_number, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
