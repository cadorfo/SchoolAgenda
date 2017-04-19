defmodule SchoolAgenda.SchoolCurriculumTest do
  use SchoolAgenda.ModelCase

  alias SchoolAgenda.SchoolCurriculum

  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SchoolCurriculum.changeset(%SchoolCurriculum{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SchoolCurriculum.changeset(%SchoolCurriculum{}, @invalid_attrs)
    refute changeset.valid?
  end
end
