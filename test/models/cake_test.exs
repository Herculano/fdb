defmodule FabricaDeBolo.CakeTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Cake

  @valid_attrs %{banner: "some content", content: "some content", name: "some content", nutrition_content: "some content", recipe: "some content", thumb: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cake.changeset(%Cake{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cake.changeset(%Cake{}, @invalid_attrs)
    refute changeset.valid?
  end
end
