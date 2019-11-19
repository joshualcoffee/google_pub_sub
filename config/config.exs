import Config

config :goth,
  json: "config/creds.json" |> File.read!()
