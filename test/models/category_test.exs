defmodule FabricaDeBolo.CategoryTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Category

  @valid_attrs %{banner: "some content", excerpt: "some content", name: "some content", thumb: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    refute changeset.valid?
  end
end
