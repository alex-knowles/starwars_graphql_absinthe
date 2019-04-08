defmodule Core.Repo.Characters do
  @moduledoc """
  Static definition of some initial Star Wars Characters.
  """

  @doc """
  Return some Humans and Droids to populate a Repo.
  """
  @spec init :: [map()]
  def init do
    [
      %{
        id: "1000",
        name: "Luke Skywalker",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1002", "1003", "2000", "2001"],
        character_type: :human,
        home_planet: "Tatooine"
      },
      %{
        id: "2001",
        name: "R2-D2",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1000", "1002", "1003"],
        character_type: :droid,
        primary_function: "Astromech"
      }
    ]
  end
end
