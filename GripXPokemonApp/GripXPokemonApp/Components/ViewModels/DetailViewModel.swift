//
//  DetailViewModel.swift
//  GripXPokemonApp
//
//  Created by Joe on 16/05/2022.
//
import PokemonAPI

import Foundation

@MainActor class DetailViewModel: ObservableObject {
    let pokemonAPI: PokemonAPI
    
    enum LoadingState {
        case loading, loaded, failed
    }
    @Published var loadingState = LoadingState.loading
    @Published var name: String
    @Published var pokemon: PKMPokemon?
    @Published var error: Error?
    
    init(for name: String, pokemonAPI: PokemonAPI) {
        self.name = name
        self.pokemonAPI = pokemonAPI
    }
    
    func fetchPokemon() async {
        do {
            pokemon = try await pokemonAPI.pokemonService.fetchPokemon(name)
            loadingState = .loaded
        } catch {
            self.error = error
            loadingState = .failed
        }
    }
}
