//
//  NetworkManager.swift
//  GraphQL
//
//  Created by Rajwinder Singh on 12/13/23.
//

import Foundation
import Apollo
import CountryAPI

class NetworkManager: NSObject {
    static let sharedInstance: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    
    let apolloClient = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    func fetchCountries(completion: @escaping ([GetAllCountriesQuery.Data.Country]) -> Void) {
        apolloClient.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    completion(countries.compactMap { $0 })
                }
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}

let networkManagerInstance = NetworkManager.sharedInstance
