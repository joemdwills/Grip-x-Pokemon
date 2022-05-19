//
//  NameView.swift
//  GripXPokemonApp
//
//  Created by Joe on 16/05/2022.
//

import SwiftUI
import PokemonAPI

struct NameView: View {
    private var name: String = "charmander"
    private var baseExperience: Int = 266
    
    var body: some View {
        ZStack {
            HStack {
                Text(name)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .font(.title2.italic())
                    .padding([.top, .bottom])
                
                Spacer()
            }
            .padding(.leading)
            .background(.gray.opacity(0.2))
            .clipShape(Capsule())
            .padding(.trailing, 20)
            
            HStack {
                Spacer()
                
                VStack {
                    HStack {
                        Text("XP")
                            .font(.headline)
                        Text("\(baseExperience)")
                            .font(.title)
                            .fontWeight(.black)
                    }
                    .frame(width: 100, height: 75)
                    .background(.black)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            .padding(.trailing, 10)
        }
        .padding(.leading, 10)
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        self.name = pokemon.name ?? "Unknown Pokemon"
        self.baseExperience = pokemon.baseExperience ?? 0
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
