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
                    LazyVStack {
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
                            .padding(.vertical, 4)
                        }
                    }
                }

                Section(header: Text("Phrases")) {
                    LazyVStack {
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
                            .padding(.vertical, 4)
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
