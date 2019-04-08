# Star Wars GraphQL example server, in Absinthe

An Elixir web server implementation of the Star Wars example schema from [https://graphql.org/](https://graphql.org/).

### See also

* [starWarsSchema.js](https://github.com/graphql/graphql-js/blob/master/src/__tests__/starWarsSchema.js)
* [Absinthe](https://github.com/absinthe-graphql/absinthe)

## Installation

```
git clone https://github.com/alex-knowles/starwars_graphql_absinthe
cd starwars_graphql_absinthe
mix deps.get
```

## Running the server

```
mix phx.server
```

The server will run on port 4000.

In your browser, navigate to http://localhost:4000/graphiql
