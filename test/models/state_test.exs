defmodule FabricaDeBolo.StateTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.State

  @valid_attrs %{name: "some content", uf: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = State.changeset(%State{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = State.changeset(%State{}, @invalid_attrs)
    refute changeset.valid?
  end
end
