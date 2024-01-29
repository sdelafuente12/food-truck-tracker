defmodule FoodTruckTracker.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :external_id, :string, null: false
      add :name, :string, null: false
      add :address, :string, null: false
      add :type, :string
      add :status, :string
      add :description, :string
      add :latitude, :string
      add :longitude, :string
      add :schedule, :string

      timestamps()
    end
  end
end
