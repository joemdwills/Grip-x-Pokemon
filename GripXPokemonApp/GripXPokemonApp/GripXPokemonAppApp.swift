//
//  GripXPokemonAppApp.swift
//  GripXPokemonApp
//
//  Created by Joe on 13/05/2022.
//
import PokemonAPI

import SwiftUI


@main
struct GripXPokemonAppApp: App {
    var body: some Scene {
        let pokemonAPI = PokemonAPI()
        let viewModel = ListViewModel(pokemonAPI: pokemonAPI)
        WindowGroup {
            ListView(viewModel: viewModel)
                .environmentObject(pokemonAPI)
        }
    }
}
