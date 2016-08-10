defmodule FabricaDeBolo.Cake do
  use FabricaDeBolo.Web, :model

  schema "cakes" do
    field :name, :string
    field :content, :string
    field :recipe, :string
    field :nutrition_content, :string
    field :thumb, :string
    field :banner, :string
    belongs_to :category, FabricaDeBolo.Category

    timestamps
  end

  @required_fields ~w(name content recipe nutrition_content thumb banner)
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
