//
//  Flashcard.swift
//  DentalSpanish
//
//  Created by Juan Arredondo on 7/25/24.
//

import Foundation

struct Flashcard: Identifiable, Codable {
    var id = UUID()
    var term: String
    var definition: String
}
