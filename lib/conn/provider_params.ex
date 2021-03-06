defmodule Agala.Provider.Telegram.Conn.ProviderParams do
  @moduledoc """
  This module describes provider params for `Agala.Provider.Telegram` provider.
  You can use the specification to check if your params will be accepted by `Agala.Bot` constructors.

  Provider params consist of:
  * `:token`: this is your **Telegram** token, generated by the **BotFather**
  * `:poll_timeout`: timeout for waiting LongPolling response. In production the best is `:infinity`.
  * `:response_timeout`: This timeout is for server acceptance of Bot responses. It should be standard for HTTP
  connections. If it fails - that means that your bot failed to send response to Telegram server.
  * `:hackney_opts`: these are options for Hackney - you can specify **proxy** or **SSL** for your bot here.
  """

  defstruct [
    token: nil,
    poll_timeout: nil,     #timeout for poller to receive data - infinity
    response_timeout: nil, #timeout for responser to receive response - normal
    hackney_opts: Keyword.new
  ]

  @typedoc """
  Telegram provider params.

  Provider params consist of:
  * `:token`: this is your **Telegram** token, generated by the **BotFather**
  **Default**: `nil`
  * `:poll_timeout`: timeout for waiting LongPolling response. In production the best is `:infinity`.
  **Default**: `nil`
  * `:response_timeout`: This timeout is for server acceptance of Bot responses. It should be standard for HTTP
  connections. If it fails - that means that your bot failed to send response to Telegram server.
  **Default**: `nil`
  * `:hackney_opts`: these are options for Hackney - you can specify **proxy** or **SSL** for your bot here.
  **Default**: `[]`
  """
  @type t :: %Agala.Provider.Telegram.Conn.ProviderParams{
    token: String.t,
    poll_timeout: integer | :infinity,
    response_timeout: integer | :infinity,
    hackney_opts: Keyword.t
  }

  @behaviour Access
  @doc false
  def fetch(bot_params, key) do
    Map.fetch(bot_params, key)
  end

  @doc false
  def get(structure, key, default \\ nil) do
    Map.get(structure, key, default)
  end

  @doc false
  def get_and_update(term, key, list) do
    Map.get_and_update(term, key, list)
  end

  @doc false
  def pop(term, key) do
    {get(term, key), term}
  end
end
