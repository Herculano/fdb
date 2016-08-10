defmodule FabricaDeBolo.Repo.Migrations.CreateBanner do
  use Ecto.Migration

  def change do
    create table(:banners) do
      add :title, :string
      add :lead, :text
      add :url, :string
      add :active, :integer
      add :active_at, :datetime

      timestamps
    end

  end
end
