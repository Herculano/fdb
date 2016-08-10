defmodule FabricaDeBolo.Repo.Migrations.CreateNewsletter do
  use Ecto.Migration

  def change do
    create table(:newsletters) do
      add :name, :string
      add :email, :string
      add :actived, :integer

      timestamps
    end

  end
end
