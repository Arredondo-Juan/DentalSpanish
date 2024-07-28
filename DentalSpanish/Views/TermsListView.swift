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
                        VStack(alignment: .leading) {
                            Text(flashcard.term)
                                .font(.headline)
                            Text(flashcard.definition)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Button(action: {
                                viewModel.speak(flashcard.definition)
                            }) {
                                Image(systemName: "speaker.wave.2.fill")
                                    .padding(.top, 10)
                            }
                        }
                    }
                }

                Section(header: Text("Phrases")) {
                    ForEach(filteredPhrases) { flashcard in
                        VStack(alignment: .leading) {
                            Text(flashcard.term)
                                .font(.headline)
                            Text(flashcard.definition)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Button(action: {
                                viewModel.speak(flashcard.definition)
                            }) {
                                Image(systemName: "speaker.wave.2.fill")
                                    .padding(.top, 10)
                            }
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
