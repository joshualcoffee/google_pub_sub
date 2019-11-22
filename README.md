# Google PubSub demo
The purpose of this repo is to demo how you can gate events to services.  

## Ideas for this demo
* The organization will communicate via a single topic and a single subscription
* The PubSub service will be the gatekeeper for all other services that would like to use the organizations PubSub system
* Additional services can subscribe to the PubSub gateway by emitting a subscription with the events the service will subscribe to.  There is a subscription library located at: https://github.com/joshualcoffee/google_pub_sub/blob/master/lib/ps/subscription.ex that will handle this automatically.  You can see this in action by viewing https://github.com/joshualcoffee/google_pub_sub/blob/master/lib/ps/application.ex#L23
* Broadway will handle consuming messages for the subscription.  There is a base consumer that will handle most of this logic out of the box: https://github.com/joshualcoffee/google_pub_sub/blob/master/lib/consumers/base_consumer.ex
* When the PubSub service receives a new event it will check to see what services should receive the event and emit it to those services.  
* Create subscriptions and topics dynamically. This will allow any service to consume events with little to no help from admins.  Since subscriptions will expire on their own you can create as many as you would like.

## Getting started:
You will need a creds.json file from google pubsub.  After that you can play this with demo.

## Starting the app:
* run `mix deps.get`
* run `iex -S mix`
## Emitting events:
```elixir
PS.Client.post("peerfit_pub_sub", "classUpdated", %{
 test_data: "moo"
})
```
