defmodule Meals.SnacksTest do
  use Meals.DataCase

  alias Meals.Snacks

  describe "meals" do
    alias Meals.Snacks.Meal

    @valid_attrs %{calorias: 42, data: ~N[2010-04-17 14:00:00], descricao: "some descricao"}
    @update_attrs %{calorias: 43, data: ~N[2011-05-18 15:01:01], descricao: "some updated descricao"}
    @invalid_attrs %{calorias: nil, data: nil, descricao: nil}

    def meal_fixture(attrs \\ %{}) do
      {:ok, meal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Snacks.create_meal()

      meal
    end

    test "list_meals/0 returns all meals" do
      meal = meal_fixture()
      assert Snacks.list_meals() == [meal]
    end

    test "get_meal!/1 returns the meal with given id" do
      meal = meal_fixture()
      assert Snacks.get_meal!(meal.id) == meal
    end

    test "create_meal/1 with valid data creates a meal" do
      assert {:ok, %Meal{} = meal} = Snacks.create_meal(@valid_attrs)
      assert meal.calorias == 42
      assert meal.data == ~N[2010-04-17 14:00:00]
      assert meal.descricao == "some descricao"
    end

    test "create_meal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Snacks.create_meal(@invalid_attrs)
    end

    test "update_meal/2 with valid data updates the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{} = meal} = Snacks.update_meal(meal, @update_attrs)
      assert meal.calorias == 43
      assert meal.data == ~N[2011-05-18 15:01:01]
      assert meal.descricao == "some updated descricao"
    end

    test "update_meal/2 with invalid data returns error changeset" do
      meal = meal_fixture()
      assert {:error, %Ecto.Changeset{}} = Snacks.update_meal(meal, @invalid_attrs)
      assert meal == Snacks.get_meal!(meal.id)
    end

    test "delete_meal/1 deletes the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{}} = Snacks.delete_meal(meal)
      assert_raise Ecto.NoResultsError, fn -> Snacks.get_meal!(meal.id) end
    end

    test "change_meal/1 returns a meal changeset" do
      meal = meal_fixture()
      assert %Ecto.Changeset{} = Snacks.change_meal(meal)
    end
  end
end
