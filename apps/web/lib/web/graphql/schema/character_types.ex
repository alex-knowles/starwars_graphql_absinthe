defmodule Web.GraphQL.Schema.CharacterTypes do
  @moduledoc """
  Schema definitions for Character types.
  """
  use Absinthe.Schema.Notation

  alias Web.GraphQL.Resolvers.Character, as: CharacterResolver

  @desc "A character in the Star Wars Trilogy"
  interface :character do
    @desc "The ID of the character."
    field(:id, non_null(:string))

    @desc "The name of the character."
    field(:name, :string)

    @desc "The friends of the character, or an empty list if they have none."
    field(:friends, list_of(:character))

    @desc "Which movies the character appears in."
    field(:appears_in, list_of(:episode))

    @desc "All secrets about their past."
    field(:secret_backstory, :string)

    resolve_type(fn
      %{character_type: :droid}, _ -> :droid
      %{character_type: :human}, _ -> :human
      _, _ -> nil
    end)
  end

  @desc "A mechanical creature in the Star Wars universe."
  object :droid do
    interfaces([:character])

    @desc "The ID of the droid."
    field(:id, non_null(:string))

    @desc "The name of the droid."
    field(:name, :string)

    @desc "The friends of the droid, or an empty list if they have none."
    field :friends, list_of(:character) do
      resolve(&CharacterResolver.friends_for_character/3)
    end

    @desc "Which movies the droid appears in."
    field(:appears_in, list_of(:episode))

    @desc "Construction date and the name of the designer."
    field(:secret_backstory, :string)

    @desc "The droid's primary function."
    field(:primary_function, :string)
  end

  @desc "A humanoid creature in the Star Wars universe."
  object :human do
    interfaces([:character])

    @desc "The ID of the human."
    field(:id, non_null(:string))

    @desc "The name of the human."
    field(:name, :string)

    @desc "The friends of the human, or an empty list if they have none."
    field :friends, list_of(:character) do
      resolve(&CharacterResolver.friends_for_human/3)
    end

    @desc "Which movies the human appears in."
    field(:appears_in, list_of(:episode))

    @desc "Where are they from and how they came to be who they are."
    field(:secret_backstory, :string)

    @desc "The home planet of the human, of null if unknown."
    field(:home_planet, :string)
  end
end
