defmodule PS.MboConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/mbo_sync"
  alias Broadway.Message

  def handle_event("classUpdated", message, _) do
    IO.inspect(message)
  end
end
