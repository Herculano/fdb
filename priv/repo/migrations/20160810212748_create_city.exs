defmodule FabricaDeBolo.Repo.Migrations.CreateCity do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :state_id, references(:states, on_delete: :nothing)

      timestamps
    end
    create index(:cities, [:state_id])

  end
end
