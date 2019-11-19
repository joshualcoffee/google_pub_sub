defmodule PS.MboConsumer do
  use PS.BaseConsumer, subscription: "projects/pubsub-demo-259418/subscriptions/mbo"
  alias Broadway.Message

  def handle_event(event, message, _) do
    IO.inspect(event)
    IO.inspect(message)
  end
end
