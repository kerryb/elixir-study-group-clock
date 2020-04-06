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

  def create(conn, %{"timer" => params}) do
    timer = %Timer{} |> Timer.changeset(params)

    case Timers.create(timer) do
      {:ok, _} ->
        conn |> redirect(to: "/")

      {:error, timer} ->
        conn
        |> put_flash(:error, "Failed to create a new timer")
        |> assign(:timer, timer)
        |> render("new.html")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Timers.delete(id) do
      {:ok, _} ->
        conn |> redirect(to: "/")

      {:error, timer} ->
        conn
        |> put_flash(:error, "Failed to delete timer")
        |> redirect(to: "/")
    end
  end
end
