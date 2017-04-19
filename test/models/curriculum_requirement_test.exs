defmodule SchoolAgenda.CurriculumRequirementTest do
  use SchoolAgenda.ModelCase

  alias SchoolAgenda.CurriculumRequirement

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CurriculumRequirement.changeset(%CurriculumRequirement{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CurriculumRequirement.changeset(%CurriculumRequirement{}, @invalid_attrs)
    refute changeset.valid?
  end
end
