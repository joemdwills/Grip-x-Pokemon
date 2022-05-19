//
//  SpritesView.swift
//  GripXPokemonApp
//
//  Created by Joe on 16/05/2022.
//
import PokemonAPI

import SwiftUI


struct SpritesView: View {
    private var frontImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"
    private var frontShinyImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/4.png"
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                AsyncImage(url: URL(string: frontImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
                AsyncImage(url: URL(string: frontShinyImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        guard let frontImage = pokemon.sprites?.frontDefault else { return }
        guard let frontShinyImage = pokemon.sprites?.frontShiny else { return }
        self.frontImage = frontImage
        self.frontShinyImage = frontShinyImage
    }
}

struct SpritesView_Previews: PreviewProvider {
    static var previews: some View {
        SpritesView()
    }
}
