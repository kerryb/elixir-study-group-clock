defmodule Clock.Repo.Migrations.AddUniqueConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:timers, [:seconds])
  end
end
