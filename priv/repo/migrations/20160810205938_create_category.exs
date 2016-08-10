defmodule FabricaDeBolo.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :excerpt, :text
      add :thumb, :string
      add :banner, :string

      timestamps
    end

  end
end
