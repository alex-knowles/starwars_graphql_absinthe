defmodule Web.GraphQL.Resolvers.Starship do
  @moduledoc """
  Functions to resolve Starship queries and fields.
  """

  @doc """
  Resolver for the 'starship' query.
  """
  @spec starship(map(), Absinthe.Resolution.t()) :: {:ok, map() | nil}
  def starship(args, resolution)
  def starship(%{id: id}, _), do: {:ok, Core.starship_by_id(id)}
end