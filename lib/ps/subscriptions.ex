defmodule PS.Subscriptions do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    {:ok, %{subscriptions: [], dispatch_map: %{}}}
  end

  def add_subscription(subscription, events) do
    GenServer.cast(__MODULE__, {:add_subscription, {subscription, events}})
  end

  def handle_cast({:add_subscription, {subscription, events}}, %{
        subscriptions: subscriptions,
        dispatch_map: dispatch_map
      }) do
    dispatch_map =
      events
      |> Enum.reduce(dispatch_map, fn event, acc ->
        event_subs = [subscription | Map.get(acc, event, [])]

        acc
        |> Map.put(event, event_subs)
      end)

    {:noreply, %{subscriptions: [subscription | subscriptions], dispatch_map: dispatch_map}}
  end

  def get_subscriptions do
    GenServer.call(__MODULE__, :get_subscriptions)
  end

  def get_subscribers_for_event(event) do
    GenServer.call(__MODULE__, {:get_subscribers_for_event, event})
  end

  def handle_call(:get_subscriptions, _from, %{subscriptions: subscriptions} = state) do
    {:reply, subscriptions, state}
  end

  def handle_call(
        {:get_subscribers_for_event, event},
        _from,
        %{dispatch_map: dispatch_map} = state
      ) do
    {:reply, Map.get(dispatch_map, event, []), state}
  end
end
