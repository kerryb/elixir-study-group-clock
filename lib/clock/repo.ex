defmodule Clock.Repo do
  use Ecto.Repo,
    otp_app: :clock,
    adapter: Ecto.Adapters.Postgres
end
