defmodule Clock.Timers do
  alias Clock.{Repo, Timer}

  def all do
    Repo.all(Timer)
  end

  def create(changeset) do
    Repo.insert(changeset)
  end
end
