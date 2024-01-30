# Food Truck Tracker

Food Truck Tracker is an app for all Food Truck Afficionados in the San Francisco area.\
We ingest data and display from [DataSF](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data).\
Users can also add, edit, and delete entries to customize the app to their liking!

---

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Grab data in IEx with `FoodTruckTrackerWeb.FoodTruckController.get_food_trucks_from_api()`
    
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser to view, add, edit, and delete your food trucks.