defmodule Meals.Snacks.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "meals" do
    field :calorias, :integer
    field :data, :naive_datetime
    field :descricao, :string

    timestamps()
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:descricao, :data, :calorias])
    |> validate_required([:descricao, :data, :calorias])
  end
end
