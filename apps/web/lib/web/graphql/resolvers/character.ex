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
  Resolves the 'friends' field for a given character.

  This is a naive implementation! Oh dear!
  """
  @spec friends_for_human(map(), map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def friends_for_human(parent, args, resolution)

  def friends_for_human(%{friend_ids: friend_ids}, _, _) do
    friends = Core.characters_by_id(friend_ids)
    {:ok, friends}
  end

  @doc """
  Resolves the 'friends' field for a given character.

  This is the Dataloader version. Beep boop.
  """
  @spec friends_for_droid(map(), map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def friends_for_droid(parent, args, resolution)

  def friends_for_droid(character, _, %{context: %{loader: loader}}) do
    loader
    |> Dataloader.load(Core, :friends_for_character, character)
    |> on_load(fn loader ->
      friends = Dataloader.get(loader, Core, :friends_for_character, character)
      {:ok, friends}
    end)
  end
end
