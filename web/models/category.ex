defmodule FabricaDeBolo.Category do
  use FabricaDeBolo.Web, :model

  schema "categories" do
    field :name, :string
    field :excerpt, :string
    field :thumb, :string
    field :banner, :string

    timestamps
  end

  @required_fields ~w(name excerpt thumb banner)
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
