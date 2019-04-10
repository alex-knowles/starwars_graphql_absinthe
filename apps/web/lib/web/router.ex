defmodule Web.Router do
  use Web, :router

  alias Web.GraphQL.Schema

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Web do
    pipe_through :api
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Schema
  end
end
