defmodule Web.GraphQL.Schema do
  @moduledoc """
  Star Wars GraphQL schema for Absinthe to compile.
  """
  use Absinthe.Schema

  alias Web.GraphQL.Resolvers.Character, as: CharacterResolver

  import_types(__MODULE__.CharacterTypes)

  query do
    field :hero, :character do
      resolve(&CharacterResolver.hero/3)
    end
  end

  @desc "One of the films in the Star Wars Trilogy."
  enum :episode do
    value(:newhope)
    value(:empire)
    value(:jedi)
  end
end
