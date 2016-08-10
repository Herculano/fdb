defmodule FabricaDeBolo.StoreTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Store

  @valid_attrs %{address: "some content", cel: "some content", district: "some content", hour: "some content", lat: "some content", lng: "some content", name: "some content", tel: "some content", waths: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Store.changeset(%Store{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Store.changeset(%Store{}, @invalid_attrs)
    refute changeset.valid?
  end
end
