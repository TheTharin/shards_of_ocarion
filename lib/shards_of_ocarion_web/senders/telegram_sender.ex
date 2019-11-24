defmodule ShardsOfOcarionWeb.Senders.TelegramSender do
  @callback send_message(integer(), binary(), keyword()) :: tuple()
  @callback delete_message(integer(), integer()) :: tuple()

  @telegram_tool Application.get_env(:shards_of_ocarion, :tg_tool)

  @spec send_message(integer(), binary(), keyword()) ::
          {:ok, term()} | {:error, :message_not_sent}
  def send_message(chat_id, text, options \\ []) do
    perform_action(
      :message_sent,
      :message_not_sent,
      fn ->
        @telegram_tool.send_message(chat_id, text, options)
      end
    )
  end

  @spec delete_message(integer(), integer()) ::
          {:ok, term()} | {:error, :message_not_deleted}
  def delete_message(chat_id, message_id) do
    perform_action(
      :message_deleted,
      :message_not_deleted,
      fn ->
        @telegram_tool.delete_message(chat_id, message_id)
      end
    )
  end

  @spec perform_action(atom(), atom(), fun(), integer()) :: {:ok, term()} | {:error, term()}
  defp perform_action(_success_message, _error_message, _func, _times \\ 5)
  defp perform_action(_, error_message, _, 0), do: {:error, error_message}

  defp perform_action(success_message, error_message, func, times) do
    case func.() do
      {:ok, _} = success_message ->
        success_message

      {:error, _} ->
        retry(fn ->
          perform_action(success_message, error_message, func, times - 1)
        end)
    end
  end

  defp retry(func) do
    unless Application.get_env(:shards_of_ocarion, :env) == :test do
      :timer.sleep(5000)
    end

    func.()
  end
end
