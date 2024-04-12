//
//  WordModel.swift
//  SpanishLingo
//
//  Created by Mehdi on 12/4/2024.
//

import SwiftUI

struct WordModel: Identifiable {
    var id: String = UUID().uuidString
    var word: String
    var definition: String
    var pronunciation: String
}


class WordDataModel {
    static let shared = WordDataModel()
    
    var words: [WordModel] = [
        .init(word: "Sí", definition: "Yes", pronunciation: "/si/"),
        .init(word: "No", definition: "No", pronunciation: "/no/"),
        .init(word: "Por favor", definition: "Please", pronunciation: "/por faˈvor/"),
        .init(word: "Lo siento", definition: "I'm sorry", pronunciation: "/lo ˈsjen.to/"),
        .init(word: "Comida", definition: "Food", pronunciation:  "/koˈmi.ða/")
    ]
}
