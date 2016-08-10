defmodule FabricaDeBolo.Newsletter do
  use FabricaDeBolo.Web, :model

  schema "newsletters" do
    field :name, :string
    field :email, :string
    field :actived, :integer

    timestamps
  end

  @required_fields ~w(name email actived)
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
