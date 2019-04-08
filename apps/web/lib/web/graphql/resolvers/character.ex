defmodule Web.GraphQL.Resolvers.Character do
  @moduledoc """
  Functions to resolve Character queries and fields.
  """

  @spec hero(map(), map(), Absinthe.Resolution.t()) :: {:ok, map()}
  def hero(_parent, args, resolution)
  def hero(_, %{episode: episode}, _), do: {:ok, Core.hero(episode)}
  def hero(_, _, _), do: {:ok, Core.hero()}
end
