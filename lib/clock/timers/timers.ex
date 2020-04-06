defmodule Clock.Timers do
  alias Clock.{Repo, Timer}

  def all do
    Repo.all(Timer)
  end

  def get(id) do
    Repo.get(Timer, id)
  end

  def create(changeset) do
    Repo.insert(changeset)
  end

  def delete(id) do
    Repo.get(Timer, id) |> Repo.delete()
  end
end
