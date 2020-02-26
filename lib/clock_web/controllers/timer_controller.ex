defmodule ClockWeb.TimerController do
  use ClockWeb, :controller
  alias Clock.Timers

  def index(conn, _params) do
    conn
    |> assign(:timers, Timers.all())
    |> render("index.html")
  end
end
