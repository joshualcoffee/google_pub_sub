defmodule PS.Client do
  def post(topic, event, data, env) do
    topic = %Kane.Topic{name: topic}

    message = %Kane.Message{
      data: data,
      attributes: %{event: event, env: env}
    }

    result = Kane.Message.publish(message, topic)

    case result do
      {:ok, _return} -> IO.puts("It worked!")
      {:error, _reason} -> :ok
    end
  end
end
