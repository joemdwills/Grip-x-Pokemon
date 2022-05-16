//
//  ContentView.swift
//  GripXPokemonApp
//
//  Created by Joe on 13/05/2022.
//

import PokemonAPI

import SwiftUI


struct ListView: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    Text("Loading List")
                case .loaded:
                    if let pagedObject = viewModel.pagedObject,
                            let pokemonResults = pagedObject.results as? [PKMNamedAPIResource] {
                        List {
                            ForEach(pokemonResults, id:  \.url) { pokemon in
                                NavigationLink {
                                    DetailView(viewModel: DetailViewModel(for: pokemon.name!, pokemonAPI: pokemonAPI))
                                } label: {
                                    Text(pokemon.name!)
                                        .textCase(.uppercase)
                                }
                            }
                        }
                    }
                case .failed:
                    if let error = viewModel.error {
                        Text(error.localizedDescription)
                    }
                }
            }
            .task {
                await viewModel.fetchPokemonList()
            }
            .navigationTitle(viewModel.title)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonAPI = PokemonAPI()
        ListView(viewModel: ListViewModel(pokemonAPI: pokemonAPI))
            .environmentObject(pokemonAPI)
    }
}
