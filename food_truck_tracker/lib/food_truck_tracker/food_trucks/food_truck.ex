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

  ## external_id, name, & address are required as of now
  ## all other fields optional
  ## lat/long included for future features such
  ## as mapping/navigation

  ## fields I would change with more time:
  ## external_id would be optional in consideration of user input food trucks
  ## status/type would be an Enum set of atoms as that data seems to come back with consistency
  ## i.e. :approved/:expired :push_cart/:truck
end
