defmodule FoodTruckTracker.FoodTrucksTest do
  use FoodTruckTracker.DataCase

  alias FoodTruckTracker.FoodTrucks

  describe "food_trucks" do
    alias FoodTruckTracker.FoodTrucks.FoodTruck

    import FoodTruckTracker.FoodTrucksFixtures

    @invalid_attrs %{"longitude" => 1111}

    test "list_food_trucks/0 returns all food_trucks" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.list_food_trucks() == [food_truck]
    end

    test "get_food_truck!/1 returns the food_truck with given id" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.get_food_truck!(food_truck.id) == food_truck
    end

    test "create_food_truck/1 with valid data creates a food_truck" do
      valid_attrs = %{
        "external_id" => "0003",
        "name" => "Create Food Truck",
        "address" => "3000 Main Street"
      }

      assert {:ok, %FoodTruck{} = food_truck} = FoodTrucks.create_food_truck(valid_attrs)
    end

    test "create_food_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.create_food_truck(@invalid_attrs)
    end

    test "update_food_truck/2 with valid data updates the food_truck" do
      food_truck = food_truck_fixture()
      update_attrs = %{}

      assert {:ok, %FoodTruck{} = food_truck} =
               FoodTrucks.update_food_truck(food_truck, update_attrs)
    end

    test "update_food_truck/2 with invalid data returns error changeset" do
      food_truck = food_truck_fixture()

      assert {:error, %Ecto.Changeset{}} =
               FoodTrucks.update_food_truck(food_truck, @invalid_attrs)

      assert food_truck == FoodTrucks.get_food_truck!(food_truck.id)
    end

    test "delete_food_truck/1 deletes the food_truck" do
      food_truck = food_truck_fixture()
      assert {:ok, %FoodTruck{}} = FoodTrucks.delete_food_truck(food_truck)
      assert_raise Ecto.NoResultsError, fn -> FoodTrucks.get_food_truck!(food_truck.id) end
    end

    test "change_food_truck/1 returns a food_truck changeset" do
      food_truck = food_truck_fixture()
      assert %Ecto.Changeset{} = FoodTrucks.change_food_truck(food_truck)
    end
  end
end
