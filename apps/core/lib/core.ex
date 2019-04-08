defmodule Core do
  @moduledoc """
  Core data layer.
  """

  @luke %{
    id: "1000",
    name: "Luke Skywalker",
    appears_in: [:newhope, :empire, :jedi],
    friend_ids: ["1002", "1003", "2000", "2001"],
    character_type: :human,
    home_planet: "Tatooine"
  }

  @artoo %{
    id: "2001",
    name: "R2-D2",
    appears_in: [:newhope, :empire, :jedi],
    friend_ids: ["1000", "1002", "1003"],
    character_type: :droid,
    primary_function: "Astromech"
  }

  @type episode :: :newhope | :empire | :jedi

  @doc """
  Returns THE Hero of the entire Star Wars saga. (Beep boop whistle.)
  """
  @spec hero :: map()
  def hero, do: @artoo

  @doc """
  Returns the Hero of a given episode in the original Star Wars trilogy.
  """
  @spec hero(episode() | nil) :: map()
  def hero(episode)
  def hero(:newhope), do: @artoo
  def hero(:empire), do: @luke
  def hero(:jedi), do: @artoo
  def hero(nil), do: hero()
end
