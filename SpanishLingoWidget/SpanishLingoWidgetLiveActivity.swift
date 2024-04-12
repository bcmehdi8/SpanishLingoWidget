//
//  SpanishLingoWidgetLiveActivity.swift
//  SpanishLingoWidget
//
//  Created by Mehdi on 12/4/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SpanishLingoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SpanishLingoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SpanishLingoWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SpanishLingoWidgetAttributes {
    fileprivate static var preview: SpanishLingoWidgetAttributes {
        SpanishLingoWidgetAttributes(name: "World")
    }
}

extension SpanishLingoWidgetAttributes.ContentState {
    fileprivate static var smiley: SpanishLingoWidgetAttributes.ContentState {
        SpanishLingoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SpanishLingoWidgetAttributes.ContentState {
         SpanishLingoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SpanishLingoWidgetAttributes.preview) {
   SpanishLingoWidgetLiveActivity()
} contentStates: {
    SpanishLingoWidgetAttributes.ContentState.smiley
    SpanishLingoWidgetAttributes.ContentState.starEyes
}
