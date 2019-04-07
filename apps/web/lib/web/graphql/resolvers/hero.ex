defmodule Web.GraphQL.Resolvers.Hero do
  @moduledoc """
  Functions to resolve Hero queries and fields.
  """

  @spec hero(map(), map(), Absinthe.Resolution.t()) :: {:ok, map()}
  def hero(_parent, _args, _resolution), do: {:ok, Core.hero()}
end
