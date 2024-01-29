defmodule FoodTruckTracker.FoodTrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruckTracker.FoodTrucks` context.
  """

  @doc """
  Generate a food_truck.
  """
  def food_truck_fixture(attrs \\ %{}) do
    {:ok, food_truck} =
      attrs
      |> Enum.into(%{
        "external_id" => "0001",
        "name" => "Test Food Truck",
        "address" => "1000 Main Street"
      })
      |> FoodTruckTracker.FoodTrucks.create_food_truck()

    food_truck
  end
end
