defmodule Core do
  @moduledoc """
  Core data layer.
  """

  @doc """
  Returns a Hero from the original Star Wars trilogy. (Beep boop whistle.)
  """
  @spec hero :: map()
  def hero do
    %{
      id: "2001",
      name: "R2-D2",
      appears_in: [:newhope, :empire, :jedi],
      friend_ids: ["1000", "1002", "1003"],
      character_type: :droid,
      primary_function: "Astromech"
    }
  end
end
