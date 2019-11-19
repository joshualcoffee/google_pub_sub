defmodule PS.MbaConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/mba"
  alias Broadway.Message

  def handle_event(event, message, _) do
    IO.inspect(event)
    IO.inspect(message)
  end
end
