//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The backyard widget.

import BackyardBirdsData
import BackyardBirdsUI
import LayeredArtworkLibrary
import SwiftData
import SwiftUI
import WidgetKit

struct BackyardWidget: Widget
{
  private let kind = "Backyard Widget"

  var families: [WidgetFamily]
  {
    #if os(watchOS)
    return [.accessoryRectangular]
    #elseif os(iOS)
    return [.accessoryRectangular, .systemSmall, .systemMedium, .systemLarge]
    #else
    return [.systemSmall, .systemMedium, .systemLarge]
    #endif
  }

  var body: some WidgetConfiguration
  {
    AppIntentConfiguration(
      kind: kind,
      intent: BackyardWidgetIntent.self,
      provider: BackyardSnapshotTimelineProvider()
    )
    { entry in
      BackyardWidgetView(entry: entry)
    }
    .supportedFamilies(families)
  }
}
