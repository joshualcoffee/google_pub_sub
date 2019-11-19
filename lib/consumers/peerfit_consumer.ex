defmodule PS.PeerFitConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/peerfit"
  alias Broadway.Message
  alias PS.Subscriptions

  def handle_event("subscription", %{"subscribe_to" => events, "topic" => topic}) do
    Subscriptions.add_subscription(topic, events)
  end

  def handle_event(event, data) do
    case Subscriptions.get_subscribers_for_event(event) do
      [] ->
        :ok

      subscribers ->
        for s <- subscribers, do: Client.post(s, event, data)
    end
  end
end
