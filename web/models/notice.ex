defmodule FabricaDeBolo.Notice do
  use FabricaDeBolo.Web, :model

  schema "notices" do
    field :title, :string
    field :excerpt, :string
    field :content, :string
    field :thumb, :string
    field :slug, :string

    timestamps
  end

  @required_fields ~w(title excerpt content thumb slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
