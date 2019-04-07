defmodule Web.GraphQL.Schema do
  @moduledoc """
  Star Wars GraphQL schema for Absinthe to compile.
  """
  use Absinthe.Schema

  alias Web.GraphQL.Resolvers.Hero, as: HeroResolver

  query do
    field :hero, :droid do
      resolve(&HeroResolver.hero/3)
    end
  end

  @desc "One of the films in the Star Wars Trilogy."
  enum :episode do
    value(:newhope)
    value(:empire)
    value(:jedi)
  end

  @desc "A mechanical creature in the Star Wars universe."
  object :droid do
    @desc "The ID of the droid."
    field(:id, non_null(:string))

    @desc "The name of the droid."
    field(:name, :string)

    @desc "The friends of the droid, or an empty list if the have none."
    field(:friends, list_of(:droid))

    @desc "Which movies the droid appears in."
    field(:appearsIn, list_of(:episode))

    @desc "Construction date and the name of the designer."
    field(:secret_backstory, :string)

    @desc "The droid's primary function."
    field(:primary_function, :string)
  end

  @desc "A humanoid creature in the Star Wars universe."
  object :human do
    @desc "The ID of the human."
    field(:id, non_null(:string))

    @desc "The name of the human."
    field(:name, :string)

    @desc "The friends of the human, or an empty list if the have none."
    field(:friends, list_of(:human))

    @desc "Which movies the human appears in."
    field(:appearsIn, list_of(:episode))

    @desc "Where are they from and how they came to be who they are."
    field(:secret_backstory, :string)

    @desc "The home planet of the human, of null if unknown."
    field(:home_planet, :string)
  end
end
