# GraphQL

This project utilizes the [Trevorblades](https://countries.trevorblades.com/) GraphQL API to retrieve detailed information about countries, including country codes, names, emojis, and more. The project is built using Swift and SwiftUI, making use of the Apollo GraphQL client.

## GraphQL Queries

The GraphQL queries are defined in the project to retrieve specific data from the API. The primary query, `GetAllCountries`, fetches country codes, names, and emojis.

```graphql
query GetAllCountries {
  countries {
    code
    name
    emoji
  }
}
```

## Dependencies

- [Apollo](https://www.apollographql.com/): A GraphQL client for Swift.
- [CountryAPI]: A generated Swift package based on the GraphQL schema for the countries API.

## How to Use

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project.
