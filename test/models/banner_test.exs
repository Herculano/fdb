defmodule FabricaDeBolo.BannerTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Banner

  @valid_attrs %{active: 42, active_at: "2010-04-17 14:00:00", lead: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Banner.changeset(%Banner{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Banner.changeset(%Banner{}, @invalid_attrs)
    refute changeset.valid?
  end
end
