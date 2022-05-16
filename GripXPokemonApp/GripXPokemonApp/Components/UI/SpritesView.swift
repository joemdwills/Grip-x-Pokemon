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
    private var backImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png"
    private var frontShinyImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/4.png"
    private var backShinyImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/4.png"
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                AsyncImage(url: URL(string: frontImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    ProgressView()
                }
                AsyncImage(url: URL(string: backImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    ProgressView()
                }
                AsyncImage(url: URL(string: frontShinyImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    ProgressView()
                }
                AsyncImage(url: URL(string: backShinyImage)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .padding()
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        self.frontImage = pokemon.sprites?.frontDefault ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"
        self.backImage = pokemon.sprites?.backDefault ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/4.png"
        self.frontShinyImage = pokemon.sprites?.frontShiny ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/4.png"
        self.backShinyImage = pokemon.sprites?.backShiny ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/4.png"
    }
}

struct SpritesView_Previews: PreviewProvider {
    static var previews: some View {
        SpritesView()
    }
}
