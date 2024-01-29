defmodule FoodTruckTracker.Repo do
  use Ecto.Repo,
    otp_app: :food_truck_tracker,
    adapter: Ecto.Adapters.Postgres
end
