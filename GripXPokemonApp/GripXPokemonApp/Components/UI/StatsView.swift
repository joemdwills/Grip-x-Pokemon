//
//  StatsView.swift
//  GripXPokemonApp
//
//  Created by Joe on 17/05/2022.
//
import PokemonAPI

import SwiftUI

struct StatView: View {
    var name: String
    var stat: Int
    var statColour: Color
    
    var body: some View {
        GeometryReader { dimension in
            HStack {
                HStack {
                    Spacer()
                    Text(name + ":")
                }
                .frame(maxWidth: 75)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: CGFloat(5))
                        .frame(width: 230, height: 10)
                        .foregroundColor(.gray.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: CGFloat(5))
                        .frame(width: CGFloat(Double(stat) * 1.5), height: 10)
                        .foregroundColor(statColour.opacity(0.75))
                }
                
                Spacer()
                Text("\(stat)")
            }
            .frame(maxWidth: dimension.size.width)
            .padding([.top, .bottom])
        }
    }
}

struct StatsView: View {
    private var hp: Int = 20
    private var attack: Int = 30
    private var defense: Int = 40
    private var specialAttack: Int = 50
    private var specialDefense: Int = 40
    private var speed: Int = 80
    
    var body: some View {
        GeometryReader { dimension in
            VStack(alignment: .leading) {
                HStack {
                    Text("Stats")
                        .fontWeight(.bold)
                    Spacer()
                }
                StatView(name: "HP", stat: hp, statColour: .brown)
                StatView(name: "ATT", stat: attack, statColour: .orange)
                StatView(name: "DEF", stat: defense, statColour: .mint)
                StatView(name: "S-ATT", stat: specialAttack, statColour: .red)
                StatView(name: "S-DEF", stat: specialDefense, statColour: .green)
                StatView(name: "SPD", stat: speed, statColour: .yellow)
            }
            .frame(height: 300)
        }
    }
    
    init() { }
    
    init(pokemon: PKMPokemon) {
        self.hp = pokemon.stats?[0].baseStat ?? 0
        self.attack = pokemon.stats?[1].baseStat ?? 0
        self.defense = pokemon.stats?[2].baseStat ?? 0
        self.specialAttack = pokemon.stats?[3].baseStat ?? 0
        self.specialDefense = pokemon.stats?[4].baseStat ?? 0
        self.speed = pokemon.stats?[5].baseStat ?? 0
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
