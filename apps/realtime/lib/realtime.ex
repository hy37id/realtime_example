defmodule Realtime do
  @moduledoc """
  The core Elixir application for `Realtime`, containing all the business logic 
  and persistence.

  ## About Realtime

  TODO: briefly describe the purpose of Realtime here

  ## Domains

  `Realtime` is divided into **domains**, which can be thought
  of as features or groups of closely related features.

  - Each domain defines a single module with a public API.

  - All other modules within the domain are private and must never be called from 
    outside the domain.

  - Each domain manages its own persistence.

  - Each domain only interacts with other domains through their public API functions.

  `Realtime` provides the following domains:


  - TODO: list domains here

  ## Supporting Applications

  The `Realtime` platform also contains supporting applications.

  - `RealtimeWeb`: A lightweight
    Phoenix application which handles HTTP and Websocket requests.

  - `RealtimeAPI`: Provides a GraphQL API, which is mounted inside the `realtime_web` app's router.
  """
end
