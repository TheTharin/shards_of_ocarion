defmodule ShardsOfOcarion.General.Helpers.ChangesetHelper do
  import Ecto.Changeset

  @spec validate_current_or_past_datetime(struct(), atom()) :: struct()
  def validate_current_or_past_datetime(%{changes: changes} = changeset, field) do
    if date_time = changes[field] do
      do_validate_current_or_past_datetime(changeset, date_time, field)
    else
      changeset
    end
  end

  @spec do_validate_current_or_past_datetime(struct(), integer(), atom()) :: struct()
  defp do_validate_current_or_past_datetime(changeset, date_time, field) do
    if seconds_passed_between(date_time) >= 0 do
      changeset
    else
      changeset
      |> add_error(field, "Date in the past")
    end
  end

  @spec seconds_passed_between(integer()) :: integer()
  defp seconds_passed_between(datetime_in_epoch) do
    result =
      DateTime.from_unix!(datetime_in_epoch)
      |> DateTime.to_naive()
      |> NaiveDateTime.diff(NaiveDateTime.utc_now())

    result * -1
  end
end
