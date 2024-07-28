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

    var filteredTerms: [Flashcard] {
        viewModel.termsDeck.filter { $0.term.contains(searchText) || searchText.isEmpty }
    }

    var filteredPhrases: [Flashcard] {
        viewModel.phrasesDeck.filter { $0.term.contains(searchText) || searchText.isEmpty }
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Terms")) {
                    ForEach(filteredTerms) { flashcard in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(flashcard.term)
                                    .font(.headline)
                                Text(flashcard.definition)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            PlaybackButton(text: flashcard.definition)
                        }
                    }
                }

                Section(header: Text("Phrases")) {
                    ForEach(filteredPhrases) { flashcard in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(flashcard.term)
                                    .font(.headline)
                                Text(flashcard.definition)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            PlaybackButton(text: flashcard.definition)
                        }
                    }
                }
            }
            .navigationTitle("Terms & Phrases")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    TermsListView()
}
