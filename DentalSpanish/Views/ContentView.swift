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
            List {
                ForEach(DeckType.allCases, id: \.self) { deckType in
                    NavigationLink(destination: FlashcardListView(deckType: deckType)) {
                        Text(deckType.rawValue)
                    }
                }
            }
            .navigationTitle("Dental Spanish")
        }
    }
}


#Preview {
    ContentView()
}
