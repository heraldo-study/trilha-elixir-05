defmodule MealsWeb.MealView do
  use MealsWeb, :view
  alias MealsWeb.MealView

  def render("index.json", %{meals: meals}) do
    %{data: render_many(meals, MealView, "meal.json")}
  end

  def render("show.json", %{meal: meal}) do
    %{data: render_one(meal, MealView, "meal.json")}
  end

  def render("meal.json", %{meal: meal}) do
    %{id: meal.id,
      descricao: meal.descricao,
      data: meal.data,
      calorias: meal.calorias}
  end
end
