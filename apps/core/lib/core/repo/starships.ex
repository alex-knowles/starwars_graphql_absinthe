defmodule Core.Repo.Starships do
  @moduledoc """
  Static definition of some initial Star Wars starships.
  """

  @doc """
  Return some Starships to populate a Repo.
  """
  @spec init :: [map()]
  def init do
    [
      %{
        id: "3000",
        name: "Millenium Falcon",
        length: 34.37
      },
      %{
        id: "3001",
        name: "X-Wing",
        length: 12.5
      },
      %{
        id: "3002",
        name: "TIE Advanced x1",
        length: 9.2
      },
      %{
        id: "3003",
        name: "Imperial shuttle",
        length: 20
      }
    ]
  end
end
