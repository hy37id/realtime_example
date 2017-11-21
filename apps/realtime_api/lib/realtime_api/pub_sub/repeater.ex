defmodule RealtimeAPI.PubSub.Repeater do
  @moduledoc """
  Listens to `Realtime.PubSub`'s realtime interface and converts events 
  on certain topics to Absinthe subscription events using 
  `Absinthe.Subscription.publish/3`.

  This allows `Realtime` to publish regular Elixir tuple events 
  about realtime events which are occuring in the business logic. `RealtimeAPI`
  can pick up on those events and broadcast them the way GraphQL expects.

  The flow works like this:

  1. Client submits a mutation to `RealtimeAPI.Schema`

  2. Mutation resolver calls a function on `Realtime`, which, if successful,
     broadcasts a regular Elixir event on a topic on `Realtime.PubSub`.

     - Domains within `Realtime` can also be subscribing to these
       events, for activity feeds, analytics, reporting, etc.

  3. `RealtimeAPI.PubSub.Repeater` picks up on the event, and repeats it
     on `Realtime.PubSub %>`, but on an Absinthe-specific topic, and in
     the format that only Absinthe/Phoenix expects.
  """

  use GenServer

  alias Realtime.PubSub, warn: false
  alias Absinthe.Subscription, warn: false

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  @doc false
  def init(target) do
    PubSub.subscribe("samples")
    # PubSub.subscribe("topic2")
    {:ok, target}
  end

  def handle_info({:sample_created, sample}, target) do
    Subscription.publish(target, sample, new_sample: "*")
    {:noreply, target}
  end

  # Each message broadcasted on the watched topics will trigger a handle_info
  # callback like the one below, where `target` is the PubSub server that
  # Absinthe will use.
  #
  # def handle_info({:user_created, user}, %{target: target}) do
  #   Subscription.publish(target, user, user_created: "*")
  # end
end