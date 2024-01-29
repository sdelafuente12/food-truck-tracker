defmodule FoodTruckTrackerWeb.FoodTruckHTML do
  use FoodTruckTrackerWeb, :html

  embed_templates "food_truck_html/*"

  @doc """
  Renders a food_truck form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def food_truck_form(assigns)
end
