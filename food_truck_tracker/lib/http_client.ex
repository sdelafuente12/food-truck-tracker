defmodule FoodTruckTracker.HttpClient do
  @app_token System.get_env("FOOD_TRUCK_ACCESS_TOKEN")

  ## Leaving pagination out at the moment
  def get_food_trucks() do
    case HTTPoison.get("https://data.sfgov.org/resource/rqzj-sfat.json?$$app_token=#{@app_token}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end
