defmodule SmsSystem.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      add :street, :string
      add :city, :string
      add :state, :string
      add :zipcode, :string
      add :store_id, :string

      timestamps()
    end
  end
end
