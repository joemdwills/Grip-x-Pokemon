//
//  TypeView.swift
//  GripXPokemonApp
//
//  Created by Joe on 17/05/2022.
//
import PokemonAPI

import SwiftUI

struct TypeView: View {
    var types: [String] = ["fire", "ground"]
    var body: some View {
        HStack {
            Text("Type")
                .fontWeight(.bold)
            Spacer()
            ForEach(types, id: \.self) { type in
                Text(type)
                    .textCase(.uppercase)
            }
        }
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        self.types = pokemon.types?.compactMap({ object in
            return object.type?.name
        }) ?? ["unknown type"]
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView()
    }
}
