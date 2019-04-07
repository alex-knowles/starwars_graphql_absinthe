defmodule Web.GraphQL.Resolvers.Character do
  @moduledoc """
  Functions to resolve Character queries and fields.
  """

  @spec hero(map(), map(), Absinthe.Resolution.t()) :: {:ok, map()}
  def hero(_parent, _args, _resolution), do: {:ok, Core.hero()}
end
