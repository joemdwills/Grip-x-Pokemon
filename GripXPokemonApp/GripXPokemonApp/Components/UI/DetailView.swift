//
//  DetailView.swift
//  GripXPokemonApp
//
//  Created by Joe on 16/05/2022.
//

import SwiftUI
import PokemonAPI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    
    
    var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .loading:
                Text("Loading List")
            case .loaded:
                if let pokemon = viewModel.pokemon {
                    ScrollView {
                        VStack(spacing: 5) {
                            NameView(pokemon: pokemon)
                            SpritesView(pokemon: pokemon)
                            IDView(pokemon: pokemon)
                            Spacer()
                            TypeView(pokemon: pokemon)
                            Spacer()
                            StatsView(pokemon: pokemon)
                            Spacer()
                        }
                    }
                    .padding()
                }
            case .failed:
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchPokemon()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonAPI = PokemonAPI()
        DetailView(viewModel: DetailViewModel(for: "charizard", pokemonAPI: pokemonAPI))
    }
}
