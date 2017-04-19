defmodule SchoolAgenda.SchoolCurriculumControllerTest do
  use SchoolAgenda.ConnCase

  alias SchoolAgenda.SchoolCurriculum
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, school_curriculum_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing school curriculums"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, school_curriculum_path(conn, :new)
    assert html_response(conn, 200) =~ "New school curriculum"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, school_curriculum_path(conn, :create), school_curriculum: @valid_attrs
    assert redirected_to(conn) == school_curriculum_path(conn, :index)
    assert Repo.get_by(SchoolCurriculum, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, school_curriculum_path(conn, :create), school_curriculum: @invalid_attrs
    assert html_response(conn, 200) =~ "New school curriculum"
  end

  test "shows chosen resource", %{conn: conn} do
    school_curriculum = Repo.insert! %SchoolCurriculum{}
    conn = get conn, school_curriculum_path(conn, :show, school_curriculum)
    assert html_response(conn, 200) =~ "Show school curriculum"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, school_curriculum_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    school_curriculum = Repo.insert! %SchoolCurriculum{}
    conn = get conn, school_curriculum_path(conn, :edit, school_curriculum)
    assert html_response(conn, 200) =~ "Edit school curriculum"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    school_curriculum = Repo.insert! %SchoolCurriculum{}
    conn = put conn, school_curriculum_path(conn, :update, school_curriculum), school_curriculum: @valid_attrs
    assert redirected_to(conn) == school_curriculum_path(conn, :show, school_curriculum)
    assert Repo.get_by(SchoolCurriculum, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    school_curriculum = Repo.insert! %SchoolCurriculum{}
    conn = put conn, school_curriculum_path(conn, :update, school_curriculum), school_curriculum: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit school curriculum"
  end

  test "deletes chosen resource", %{conn: conn} do
    school_curriculum = Repo.insert! %SchoolCurriculum{}
    conn = delete conn, school_curriculum_path(conn, :delete, school_curriculum)
    assert redirected_to(conn) == school_curriculum_path(conn, :index)
    refute Repo.get(SchoolCurriculum, school_curriculum.id)
  end
end
