defmodule ClockWeb.TimerLive do
  use ClockWeb, :live_view
  alias Clock.Timers

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    timer = Timers.get(id)
    {:ok, assign(socket, seconds: timer.seconds, running: false, initial_seconds: timer.seconds)}
  end

  def handle_event("start", _params, socket) do
    Process.send_after(self, :tick, 1000)
    {:noreply, assign(socket, running: true)}
  end

  def handle_event("stop", _params, socket) do
    {:noreply, assign(socket, running: false)}
  end

  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, running: false, seconds: socket.assigns.initial_seconds)}
  end

  def handle_event(event, params, socket) do
    IO.puts("Received event #{inspect(event)} with #{inspect(params)}")
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    if socket.assigns.running do
      count_down(socket)
    else
      {:noreply, socket}
    end
  end

  defp count_down(socket) do
    if socket.assigns.seconds > 1 do
      Process.send_after(self, :tick, 1000)
    end

    {:noreply, assign(socket, seconds: socket.assigns.seconds - 1)}
  end

  def handle_info(message, socket) do
    IO.puts("Received message #{inspect(message)}")
    {:noreply, socket}
  end
end
