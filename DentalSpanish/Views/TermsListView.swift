//
//  TermsListView.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/26/24.
//

import SwiftUI

struct TermsListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredTermsAndPhrases, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.term)
                            .font(.headline)
                        Text(item.definition)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Terms & Phrases")
        }
    }
    
    private var filteredTermsAndPhrases: [Flashcard] {
        let allItems = viewModel.termsDeck + viewModel.phrasesDeck
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { $0.term.lowercased().contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    TermsListView()
}
