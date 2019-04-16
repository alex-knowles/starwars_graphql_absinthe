defmodule Core.Repo do
  @moduledoc """
  Data store for Star Wars characters, starships, and reviews.
  """
  use GenServer

  alias Core.Repo.{Characters, Starships}

  @impl GenServer
  def init(_init_arg), do: {:ok, init_state()}

  @impl GenServer
  def handle_call(request, from, state)

  def handle_call({collection_key, id}, _, state) when is_binary(id) do
    reply = get_in(state, [collection_key, id])
    {:reply, reply, state}
  end

  def handle_call({collection_key, ids}, _, state) when is_list(ids) do
    reply = Enum.map(ids, &get_in(state, [collection_key, &1]))
    {:reply, reply, state}
  end

  @spec init_state :: map()
  defp init_state do
    %{
      characters: Enum.into(Characters.init(), %{}, &map_by_id/1),
      starships: Enum.into(Starships.init(), %{}, &map_by_id/1),
      reviews: %{}
    }
  end

  @spec map_by_id(map()) :: {any(), map()}
  defp map_by_id(%{id: id} = data), do: {id, data}

  ### Client API

  @doc """
  Start a data store server.
  """
  @spec start_link(any()) :: GenServer.on_start()
  def start_link(_state), do: GenServer.start_link(__MODULE__, :ok, name: __MODULE__)

  @doc """
  Returns a Star Wars character given a unique ID -- such as "1000".

  If no character matches, `nil` is returned.
  """
  @spec character_by_id(String.t()) :: map() | nil
  def character_by_id(id) when is_binary(id),
    do: GenServer.call(__MODULE__, {:characters, id})

  @doc """
  Returns a list of Star Wars characters given a list of IDs.

  If no characters match, an empty list is returned.
  """
  @spec characters_by_id([String.t()]) :: [map()]
  def characters_by_id(ids) when is_list(ids),
    do: GenServer.call(__MODULE__, {:characters, ids})

  @doc """
  Returns a starship given a unique ID -- such as "3000".

  If no starship matches, `nil` is returned.
  """
  @spec starship_by_id(String.t()) :: map() | nil
  def starship_by_id(id) when is_binary(id),
    do: GenServer.call(__MODULE__, {:starships, id})

  @doc """
  Returns a list of starships given a list of IDs.

  If no starships match, an empty list is returned.
  """
  @spec starships_by_id([String.t()]) :: [map()]
  def starships_by_id(ids) when is_list(ids),
    do: GenServer.call(__MODULE__, {:starships, ids})
end
