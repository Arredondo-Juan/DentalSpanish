//
//  ContentView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(.green), Color(.blue)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                    VStack(spacing: 30) {
                        ForEach(DeckType.allCases, id: \.self) { deckType in
                            NavigationLink(destination: FlashcardListView(deckType: deckType)) {
                                Text(deckType.rawValue)
                            }
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .frame(width: 300, height: 180)
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(Color.blue)
                                .shadow(radius: 5, y: 5)
                                .opacity(0.6))
                        }
                    }
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}


#Preview {
    ContentView()
}
