defmodule Core.Repo do
  @moduledoc """
  Data store for Star Wars characters, starships, and reviews.
  """
  use GenServer

  alias Core.Repo.Characters

  @impl GenServer
  def init(_init_arg), do: {:ok, init_state()}

  @impl GenServer
  def handle_call(request, from, state)

  def handle_call({:character, id}, _, state) when is_binary(id) do
    reply = get_in(state, [:characters, id])
    {:reply, reply, state}
  end

  def handle_call({:character, ids}, _, state) when is_list(ids) do
    reply = Enum.map(ids, &get_in(state, [:characters, &1]))
    {:reply, reply, state}
  end

  @spec init_state :: map()
  defp init_state do
    %{
      characters: Characters.init() |> Enum.into(%{}, &{&1.id, &1}),
      starships: %{},
      reviews: %{}
    }
  end

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
    do: GenServer.call(__MODULE__, {:character, id})

  @doc """
  Returns a list of Star Wars characters given a list of IDs.

  If no characters match, an empty list is returned.
  """
  @spec characters_by_id([String.t()]) :: [map()]
  def characters_by_id(ids) when is_list(ids),
    do: GenServer.call(__MODULE__, {:character, ids})
end
