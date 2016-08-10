defmodule FabricaDeBolo.Banner do
  use FabricaDeBolo.Web, :model

  schema "banners" do
    field :title, :string
    field :lead, :string
    field :url, :string
    field :active, :integer
    field :active_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title lead url active active_at)
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
