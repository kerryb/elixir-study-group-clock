defmodule Clock.Timer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timers" do
    field :seconds, :integer
  end

  def changeset(timer, params \\ %{}) do
    timer
    |> cast(params, [:seconds])
    |> validate_required(:seconds)
    |> unique_constraint(:seconds)
  end
end
