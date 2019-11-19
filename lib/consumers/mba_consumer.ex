defmodule PS.MbaConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/mba"
  alias Broadway.Message

  def handle_event("classUpdated", message) do
    IO.inspect(message)
  end
end
