defmodule Web.GraphQL.Resolvers.Character do
  @moduledoc """
  Functions to resolve Character queries and fields.
  """

  import Absinthe.Resolution.Helpers, only: [on_load: 2]

  @doc """
  Resolver for the 'hero' query.
  """
  @spec hero(map(), map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def hero(parent, args, resolution)
  def hero(_, %{episode: episode}, _), do: {:ok, Core.hero(episode)}
  def hero(_, _, _), do: {:ok, Core.hero()}

  @doc """
  Resolver for the 'human' query.
  """
  @spec human(map(), map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def human(parent, args, resolution)
  def human(_, %{id: id}, _), do: {:ok, Core.human_by_id(id)}

  @doc """
  Resolver for the 'droid' query.
  """
  @spec droid(map(), map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def droid(parent, args, resolution)
  def droid(_, %{id: id}, _), do: {:ok, Core.droid_by_id(id)}

  @doc """
  Resolver for the 'friends' field.

  For any Character type -- Human or Droid.
  """
  @spec friends_for_character(map(), map(), Absinthe.Resolution.t()) :: tuple()
  def friends_for_character(parent, args, resolution)

  def friends_for_character(character, _, %{context: %{loader: loader}}) do
    loader
    |> Dataloader.load_many(Core, :character_by_id, character.friend_ids)
    |> on_load(fn loader ->
      friends = Dataloader.get_many(loader, Core, :character_by_id, character.friend_ids)
      {:ok, friends}
    end)
  end

  @doc """
  Resolver for the 'starships' field.
  """
  @spec starships_for_human(map(), map(), Absinthe.Resolution.t()) :: tuple()
  def starships_for_human(parent, args, resolution)

  def starships_for_human(human, _, %{context: %{loader: loader}}) do
    loader
    |> Dataloader.load_many(Core, :starship_by_id, human.starship_ids)
    |> on_load(fn loader ->
      starships = Dataloader.get_many(loader, Core, :starship_by_id, human.starship_ids)
      {:ok, starships}
    end)
  end
end
