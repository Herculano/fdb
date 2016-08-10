defmodule FabricaDeBolo.NoticeTest do
  use FabricaDeBolo.ModelCase

  alias FabricaDeBolo.Notice

  @valid_attrs %{content: "some content", excerpt: "some content", slug: "some content", thumb: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Notice.changeset(%Notice{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Notice.changeset(%Notice{}, @invalid_attrs)
    refute changeset.valid?
  end
end
