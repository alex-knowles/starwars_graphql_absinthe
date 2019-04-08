defmodule Web.GraphQL.Schema do
  @moduledoc """
  Star Wars GraphQL schema for Absinthe to compile.
  """
  use Absinthe.Schema

  alias Web.GraphQL.Resolvers.Character, as: CharacterResolver

  import_types(__MODULE__.CharacterTypes)

  query do
    @desc "Returns the hero of the Star Wars saga"
    field :hero, :character do
      @desc "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode."
      arg(:episode, :episode)

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
