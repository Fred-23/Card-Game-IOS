//
//  ContentView.swift
//  Card Game
//
//  Created by Frédéric ALPHONSE on 02/12/2022.
//

import SwiftUI

struct ContentView: View {
    // data to store the score and the value of the card
    //Only useable on this view
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore =  0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    print("deal")
                    //Generate a random number between 2 and 14 for the card
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    //Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    //Comparaison de strings mais ça marche sur swift de plus tri dans l'ordre
                    if playerCard > cpuCard {
                        playerScore += 1
                    }
                    else if cpuCard > playerCard{
                        cpuScore += 1
                    }
                    else if cpuCard == playerCard{
                        playerScore += 1
                        cpuScore += 1
                    }
                    
                } label: {
                    Image("dealbutton")
                }

                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        
                        Text("Player 1")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10.0)
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                }
                Spacer()
                
            }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
