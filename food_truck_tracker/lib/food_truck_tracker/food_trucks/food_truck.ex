defmodule FoodTruckTracker.FoodTrucks.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :external_id, :string
    field :name, :string
    field :address, :string
    field :type, :string
    field :status, :string
    field :description, :string
    field :latitude, :string
    field :longitude, :string
    field :schedule, :string

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :external_id,
      :name,
      :address,
      :type,
      :status,
      :description,
      :latitude,
      :longitude,
      :schedule
    ])
    |> validate_required([
      :external_id,
      :name,
      :address
    ])
  end
end
