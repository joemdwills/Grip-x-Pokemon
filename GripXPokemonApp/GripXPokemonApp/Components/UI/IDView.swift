//
//  IDView.swift
//  GripXPokemonApp
//
//  Created by Joe on 16/05/2022.
//
import PokemonAPI

import SwiftUI

struct IDView: View {
    private var id: Int = 114
    private var height: Int = 17
    private var weight: Int = 56
    
    var body: some View {
        HStack {
            Text("ID: \(id)")
                .fontWeight(.light)
            Text("HT: \(height)")
                .fontWeight(.light)
            Text("WT: \(weight)")
                .fontWeight(.light)
        }
        .font(.headline)
        .padding(10)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        self.id = pokemon.id ?? 0
        self.height = pokemon.height ?? 0
        self.weight = pokemon.weight ?? 0
    }
}

struct IDView_Previews: PreviewProvider {
    static var previews: some View {
        IDView()
    }
}
