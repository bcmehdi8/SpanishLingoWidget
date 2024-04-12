//
//  SpanishLingoWidget.swift
//  SpanishLingoWidget
//
//  Created by Mehdi on 12/4/2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WordEntry {
        WordEntry(word: WordDataModel.shared.words.shuffled().first!)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WordEntry {
        WordEntry(word: WordDataModel.shared.words.shuffled().first!)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WordEntry> {
        var entries: [WordEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entry = WordEntry(word: WordDataModel.shared.words.shuffled().first!)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct WordEntry: TimelineEntry {
    let date: Date = Date.now
    var word: WordModel
}

struct SpanishLingoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
         
        }
    }
}

struct SpanishLingoWidget: Widget {
    let kind: String = "SpanishLingoWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            SpanishLingoWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    SpanishLingoWidget()
} timeline: {
    WordEntry(word: WordDataModel.shared.words.shuffled().first!)
    WordEntry(word: WordDataModel.shared.words.shuffled().first!)
}
