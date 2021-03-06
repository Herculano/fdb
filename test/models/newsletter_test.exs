defmodule FabricaDeBolo.NewsletterTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Newsletter

  @valid_attrs %{actived: 42, email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Newsletter.changeset(%Newsletter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Newsletter.changeset(%Newsletter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
