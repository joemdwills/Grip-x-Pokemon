//
//  ListViewModel.swift
//  GripXPokemonApp
//
//  Created by Joe on 14/05/2022.
//
import PokemonAPI

import Foundation
import SwiftUI

@MainActor class ListViewModel: ObservableObject {
    let pokemonAPI: PokemonAPI
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @Published var loadingState = LoadingState.loading
    @Published var pagedObject: PKMPagedObject<PKMPokemon>?
    
    // UI Data
    var title: String = "Grip X Pokémon"
    var error: Error?
    
    init(pokemonAPI: PokemonAPI) {
        self.pokemonAPI = pokemonAPI
    }
    
    func fetchPokemonList(paginationState: PaginationState<PKMPokemon> = .initial(pageLimit: 10000)) async {
        do {
            pagedObject = try await pokemonAPI.pokemonService.fetchPokemonList(paginationState: paginationState)
            loadingState = .loaded
        }
        catch {
            self.error = error
            loadingState = .failed
        }
    }
}
