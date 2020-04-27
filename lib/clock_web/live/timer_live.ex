defmodule ClockWeb.TimerLive do
  use ClockWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, seconds: 123)}
  end

  def render(assigns) do
    ~L"""
    Timer: <%= @seconds %>
    """
  end
end
