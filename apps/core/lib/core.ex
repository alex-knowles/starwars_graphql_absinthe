defmodule Core do
  @moduledoc """
  Core data layer.
  """

  alias Core.Repo
  alias Dataloader.KV, as: DataloaderKV

  @luke_id "1000"
  @artoo_id "2001"

  @type episode :: :newhope | :empire | :jedi

  @doc """
  Returns THE Hero of the entire Star Wars saga. (Beep boop whistle.)
  """
  @spec hero :: map()
  def hero, do: Repo.character_by_id(@artoo_id)

  @doc """
  Returns the Hero of a given episode in the original Star Wars trilogy.
  """
  @spec hero(episode() | nil) :: map()
  def hero(episode)
  def hero(:newhope), do: Repo.character_by_id(@artoo_id)
  def hero(:empire), do: Repo.character_by_id(@luke_id)
  def hero(:jedi), do: Repo.character_by_id(@artoo_id)
  def hero(nil), do: hero()

  @doc """
  Returns a humanoid character from Star Wars.
  """
  @spec human_by_id(String.t()) :: map() | nil
  def human_by_id(id) do
    case Repo.character_by_id(id) do
      %{character_type: :human} = human -> human
      _ -> nil
    end
  end

  @doc """
  Returns a droid character from Star Wars.
  """
  @spec droid_by_id(String.t()) :: map() | nil
  def droid_by_id(id) do
    case Repo.character_by_id(id) do
      %{character_type: :droid} = droid -> droid
      _ -> nil
    end
  end

  @doc """
  Return a batch of Star Wars Characters.

  Given a list of IDs, returns a list of Characters that match.
  """
  @spec characters_by_id([String.t()]) :: [map()]
  def characters_by_id(ids) do
    ids
    |> Enum.uniq()
    |> Repo.characters_by_id()
    |> Enum.reject(&is_nil/1)
  end

  @doc """
  Returns an interface for loading Core data via Dataloader.

  Batches:

    * `:character_for_id` -- expects a character `id` field an an item key
      and returns a single character map that matches it

  """
  def dataloader_source, do: DataloaderKV.new(&load/2)

  #
  # Loads Core data at behest of `Dataloader.KV`.
  #
  @spec load(atom() | {atom(), map()}, MapSet.t()) :: map()
  defp load(batchname, item_keys)

  defp load(:character_by_id, character_ids), do: load({:character_by_id, %{}}, character_ids)

  defp load({:character_by_id, _args}, character_ids) do
    character_ids
    |> MapSet.to_list()
    |> characters_by_id()
    |> Enum.into(%{}, &{&1.id, &1})
  end
end
