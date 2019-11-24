defmodule ShardsOfOcarionWeb.NadiaBehaviour do
  @callback send_message(integer(), binary(), keyword()) ::
              {:ok, :message_sent} | {:error, %Nadia.Model.Error{}}

  @callback delete_message(integer(), integer()) ::
              {:ok, :message_deleted} | {:error, %Nadia.Model.Error{}}
end
