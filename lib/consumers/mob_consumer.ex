defmodule PS.MboConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/mbo"
  alias Broadway.Message

  def handle_event("clientMerged", message, _) do
    IO.inspect(message)
  end
end
