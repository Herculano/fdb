defmodule FabricaDeBolo.Repo.Migrations.CreateStore do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      add :tel, :string
      add :cel, :string
      add :waths, :string
      add :hour, :text
      add :address, :string
      add :district, :string
      add :lat, :string
      add :lng, :string
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps
    end
    create index(:stores, [:city_id])

  end
end
