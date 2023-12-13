//
//  CountryView.swift
//  GraphQL
//
//  Created by Rajwinder Singh on 12/13/23.
//

import SwiftUI
import CountryAPI

struct CountryView: View {
    
    @State private var countries: [GetAllCountriesQuery.Data.Country] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List(countries, id: \.code) { country in
                    HStack {
                        Text(country.emoji ?? "")
                        Text(country.name ?? "")
                    }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("Countries")
                .onAppear(perform: {
                    networkManagerInstance.fetchCountries { countries in
                        DispatchQueue.main.async {
                            self.countries = countries
                        }
                    }                }
                )
        }
    }
}

#Preview {
    CountryView()
}
