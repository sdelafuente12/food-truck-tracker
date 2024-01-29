defmodule FoodTruckTrackerWeb.FoodTruckControllerTest do
  use FoodTruckTrackerWeb.ConnCase

  import FoodTruckTracker.FoodTrucksFixtures

  @create_attrs %{"external_id" => "0002", "name" => "Create Food Truck", "address" => "2000 Main St"}
  @update_attrs %{"name" => "Updated Food Truck Name"}
  @invalid_attrs %{}

  describe "index" do
    test "lists all food_trucks", %{conn: conn} do
      conn = get(conn, ~p"/food_trucks")
      assert html_response(conn, 200) =~ "Listing Food trucks"
    end
  end

  describe "new food_truck" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/food_trucks/new")
      assert html_response(conn, 200) =~ "New Food truck"
    end
  end

  describe "create food_truck" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/food_trucks", food_truck: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/food_trucks/#{id}"

      conn = get(conn, ~p"/food_trucks/#{id}")
      assert html_response(conn, 200) =~ "#{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/food_trucks", food_truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food truck"
    end
  end

  describe "edit food_truck" do
    setup [:create_food_truck]

    test "renders form for editing chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = get(conn, ~p"/food_trucks/#{food_truck}/edit")
      assert html_response(conn, 200) =~ "Edit Food truck"
    end
  end

  describe "update food_truck" do
    setup [:create_food_truck]

    test "redirects when data is valid", %{conn: conn, food_truck: food_truck} do
      conn = put(conn, ~p"/food_trucks/#{food_truck}", food_truck: @update_attrs)
      assert redirected_to(conn) == ~p"/food_trucks/#{food_truck}"

      conn = get(conn, ~p"/food_trucks/#{food_truck}")
      assert html_response(conn, 200)
    end

    ## TODO Fix test
    test "renders errors when data is invalid", %{conn: conn, food_truck: food_truck} do
      conn = put(conn, ~p"/food_trucks/#{food_truck}", food_truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Food truck"
    end
  end

  describe "delete food_truck" do
    setup [:create_food_truck]

    test "deletes chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = delete(conn, ~p"/food_trucks/#{food_truck}")
      assert redirected_to(conn) == ~p"/food_trucks"

      assert_error_sent 404, fn ->
        get(conn, ~p"/food_trucks/#{food_truck}")
      end
    end
  end

  defp create_food_truck(_) do
    food_truck = food_truck_fixture()
    %{food_truck: food_truck}
  end
end
