defmodule Web.GraphQL.Schema do
  @moduledoc """
  Star Wars GraphQL schema for Absinthe to compile.
  """
  use Absinthe.Schema

  alias Absinthe.Middleware.Dataloader, as: DataloaderMiddleware
  alias Absinthe.Plugin

  alias Web.GraphQL.Resolvers.Character, as: CharacterResolver

  import_types(__MODULE__.CharacterTypes)

  query do
    @desc "Returns the hero of the Star Wars saga"
    field :hero, :character do
      @desc "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode."
      arg(:episode, :episode)

      resolve(&CharacterResolver.hero/3)
    end

    @desc "Return a humanoid Star Wars character."
    field :human, :human do
      @desc "ID of the human"
      arg(:id, non_null(:id))

      resolve(&CharacterResolver.human/3)
    end

    @desc "Return a droid Star Wars character."
    field :droid, :droid do
      @desc "ID of the droid"
      arg(:id, non_null(:id))

      resolve(&CharacterResolver.droid/3)
    end
  end

  @desc "One of the films in the Star Wars Trilogy."
  enum :episode do
    @desc "Released in 1977."
    value(:newhope)

    @desc "Released in 1980."
    value(:empire)

    @desc "Released in 1983."
    value(:jedi)
  end

  @doc """
  An `Absinthe.Schema` callback that allows implementors to modify context.

  The default callback is overridden in order to add a `:loader` for resolvers
  to access.
  """
  @impl Absinthe.Schema
  def context(context) do
    loader = Dataloader.add_source(Dataloader.new(), Core, Core.dataloader_source())
    Map.put(context, :loader, loader)
  end

  @doc """
  An `Absinthe.Schema` callback for adding non-default plugins to Absinthe.
  """
  @impl Absinthe.Schema
  def plugins do
    [DataloaderMiddleware] ++ Plugin.defaults()
  end
end
