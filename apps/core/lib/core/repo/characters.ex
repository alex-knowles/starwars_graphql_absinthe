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
        id: "1001",
        name: "Darth Vader",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1004"],
        character_type: :human,
        home_planet: "Tatooine"
      },
      %{
        id: "1002",
        name: "Han Solo",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1000", "1003", "2001"],
        character_type: :human
      },
      %{
        id: "1003",
        name: "Leia Organa",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1000", "1002", "2000", "2001"],
        character_type: :human,
        home_planet: "Alderaan"
      },
      %{
        id: "1004",
        name: "Wilhuff Tarkin",
        appears_in: [:newhope],
        friend_ids: ["1001"],
        character_type: :human
      },
      %{
        id: "2000",
        name: "C-3PO",
        appears_in: [:newhope, :empire, :jedi],
        friend_ids: ["1000", "1002", "1003", "2001"],
        character_type: :droid,
        primary_function: "Protocol"
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
