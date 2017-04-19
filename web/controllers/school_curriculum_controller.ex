defmodule SchoolAgenda.SchoolCurriculumController do
  use SchoolAgenda.Web, :controller

  alias SchoolAgenda.SchoolCurriculum

  def index(conn, _params) do
    school_curriculums = Repo.all(SchoolCurriculum)
    render(conn, "index.html", school_curriculums: school_curriculums)
  end

  def new(conn, _params) do
    changeset = SchoolCurriculum.changeset(%SchoolCurriculum{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"school_curriculum" => school_curriculum_params}) do
    changeset = SchoolCurriculum.changeset(%SchoolCurriculum{}, school_curriculum_params)

    case Repo.insert(changeset) do
      {:ok, _school_curriculum} ->
        conn
        |> put_flash(:info, "School curriculum created successfully.")
        |> redirect(to: school_curriculum_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    school_curriculum = Repo.get!(SchoolCurriculum, id)
    render(conn, "show.html", school_curriculum: school_curriculum)
  end

  def edit(conn, %{"id" => id}) do
    school_curriculum = Repo.get!(SchoolCurriculum, id)
    changeset = SchoolCurriculum.changeset(school_curriculum)
    render(conn, "edit.html", school_curriculum: school_curriculum, changeset: changeset)
  end

  def update(conn, %{"id" => id, "school_curriculum" => school_curriculum_params}) do
    school_curriculum = Repo.get!(SchoolCurriculum, id)
    changeset = SchoolCurriculum.changeset(school_curriculum, school_curriculum_params)

    case Repo.update(changeset) do
      {:ok, school_curriculum} ->
        conn
        |> put_flash(:info, "School curriculum updated successfully.")
        |> redirect(to: school_curriculum_path(conn, :show, school_curriculum))
      {:error, changeset} ->
        render(conn, "edit.html", school_curriculum: school_curriculum, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    school_curriculum = Repo.get!(SchoolCurriculum, id)

    Repo.delete!(school_curriculum)

    conn
    |> put_flash(:info, "School curriculum deleted successfully.")
    |> redirect(to: school_curriculum_path(conn, :index))
  end
end
