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
        Group {
            switch viewModel.loadingState {
            case .loading:
                Text("Loading List")
            case .loaded:
                if let pokemon = viewModel.pokemon {
                    VStack {
                        NameView(pokemon: pokemon)
                        SpritesView(pokemon: pokemon)
                        IDView(pokemon: pokemon)
                        // Type View
                        HStack {
                            Text("Stats")
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    }
                }
            case .failed:
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                }
            }
        }
        .task {
            await viewModel.fetchPokemon()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonAPI = PokemonAPI()
        DetailView(viewModel: DetailViewModel(for: "charmander", pokemonAPI: pokemonAPI))
    }
}
