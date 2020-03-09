defmodule ClockWeb.TimerController do
  use ClockWeb, :controller
  alias Clock.{Timer, Timers}

  def index(conn, _params) do
    conn
    |> assign(:timers, Timers.all())
    |> render("index.html")
  end

  def new(conn, _params) do
    conn
    |> assign(:timer, %Timer{} |> Timer.changeset())
    |> render("new.html")
  end
end
