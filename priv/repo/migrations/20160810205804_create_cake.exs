defmodule FabricaDeBolo.Repo.Migrations.CreateCake do
  use Ecto.Migration

  def change do
    create table(:cakes) do
      add :name, :string
      add :content, :text
      add :recipe, :text
      add :nutrition_content, :text
      add :thumb, :string
      add :banner, :string
      add :related, :text
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps
    end
    create index(:cakes, [:category_id])

  end
end
