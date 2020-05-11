defmodule Clock.Repo.Migrations.CreateTimers do
  use Ecto.Migration

  def change do
    create table(:timers) do
      add :seconds, :integer
    end
  end
end
