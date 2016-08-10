defmodule FabricaDeBolo.Repo.Migrations.CreateNotice do
  use Ecto.Migration

  def change do
    create table(:notices) do
      add :title, :string
      add :excerpt, :text
      add :content, :text
      add :thumb, :string
      add :slug, :string

      timestamps
    end

  end
end
