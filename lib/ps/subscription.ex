defmodule PS.Subscription do
  alias Kane.{Topic, Subscription}
  alias PS.Client

  def delete do
    topic = %Topic{name: "moo"}
    Kane.Topic.delete(topic)
  end

  def subscribe(consumer, name, events \\ [], env \\ "prod") do
    create_subscription_and_topic(name)
    DynamicSupervisor.start_child(PS.DynamicSupervisor, consumer)

    Client.post(
      "peerfit_pub_sub",
      "subscription",
      %{
        topic: name,
        subscribe_to: events
      },
      env
    )
  end

  def create_subscription_and_topic(name) do
    topic = %Kane.Topic{
      name: name
    }

    subscription = %Subscription{
      name: name,
      topic: topic
    }

    create_topic(topic)
    Subscription.create(subscription)
  end

  def create_topic(topic) do
    Kane.Topic.create(topic)
  end
end
