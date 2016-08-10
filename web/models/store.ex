defmodule FabricaDeBolo.Store do
  use FabricaDeBolo.Web, :model

  schema "stores" do
    field :name, :string
    field :tel, :string
    field :cel, :string
    field :waths, :string
    field :hour, :string
    field :address, :string
    field :district, :string
    field :lat, :string
    field :lng, :string
    belongs_to :city, FabricaDeBolo.City

    timestamps
  end

  @required_fields ~w(name tel cel waths hour address district lat lng)
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
