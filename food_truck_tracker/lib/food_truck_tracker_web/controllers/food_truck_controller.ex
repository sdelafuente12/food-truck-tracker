defmodule FoodTruckTrackerWeb.FoodTruckController do
  use FoodTruckTrackerWeb, :controller

  alias FoodTruckTracker.FoodTrucks
  alias FoodTruckTracker.FoodTrucks.FoodTruck
  alias FoodTruckTracker.HttpClient

  def index(conn, _params) do
    food_trucks = FoodTrucks.list_food_trucks()
    render(conn, :index, food_trucks: food_trucks)
  end

  def new(conn, _params) do
    changeset = FoodTrucks.change_food_truck(%FoodTruck{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"food_truck" => food_truck_params}) do
    case FoodTrucks.create_food_truck(food_truck_params) do
      {:ok, food_truck} ->
        conn
        |> put_flash(:info, "Food truck created successfully.")
        |> redirect(to: ~p"/food_trucks/#{food_truck}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food_truck = FoodTrucks.get_food_truck!(id)
    render(conn, :show, food_truck: food_truck)
  end

  def edit(conn, %{"id" => id}) do
    food_truck = FoodTrucks.get_food_truck!(id)
    changeset = FoodTrucks.change_food_truck(food_truck)
    render(conn, :edit, food_truck: food_truck, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food_truck" => food_truck_params}) do
    food_truck = FoodTrucks.get_food_truck!(id)

    case FoodTrucks.update_food_truck(food_truck, food_truck_params) do
      {:ok, food_truck} ->
        conn
        |> put_flash(:info, "Food truck updated successfully.")
        |> redirect(to: ~p"/food_trucks/#{food_truck}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, food_truck: food_truck, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_truck = FoodTrucks.get_food_truck!(id)
    {:ok, _food_truck} = FoodTrucks.delete_food_truck(food_truck)

    conn
    |> put_flash(:info, "Food truck deleted successfully.")
    |> redirect(to: ~p"/food_trucks")
  end

  def get_food_trucks_from_api do
    HttpClient.get_food_trucks()
    |> Enum.map(fn x -> build_and_insert_entry(x) end)
  end

  def build_and_insert_entry(entry) do
   entry = %{
      "external_id" => entry["objectid"],
      "name" => entry["applicant"],
      "address" => entry["address"],
      "type" => entry["facilitytype"],
      "status" => entry["status"],
      "latitude" => entry["latitude"],
      "longitude" => entry["longitude"],
      "schedule" => entry["schedule"]
    }

    ## excluded description field from this round of implementation
    ## as max string limit results in error
    ## future solution would include truncation

    case FoodTrucks.create_food_truck(entry) do
      {:ok, food_truck} ->
        IO.puts("#{food_truck.external_id} added")
      {:error, reason} ->
        IO.puts(inspect(reason))
    end
  end
end
