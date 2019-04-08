defmodule Core do
  @moduledoc """
  Core data layer.
  """

  alias Core.Repo

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
end
