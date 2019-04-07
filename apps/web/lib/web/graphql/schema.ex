defmodule Web.GraphQL.Schema do
  @moduledoc """
  Star Wars GraphQL schema for Absinthe to compile.
  """
  use Absinthe.Schema

  alias Web.GraphQL.Resolvers.Hero, as: HeroResolver

  query do
    field :hero, :string do
      resolve(&HeroResolver.hero/3)
    end
  end

  @desc "One of the films in the Star Wars Trilogy."
  enum :episode do
    value(:newhope)
    value(:empire)
    value(:jedi)
  end
end
