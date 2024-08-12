//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The entry point for the watch app.

import BackyardBirdsData
import SwiftData
import SwiftUI

@main
struct BackyardBirdsWatchApp: App
{
  var body: some Scene
  {
    WindowGroup
    {
      ContentView()
        .backyardBirdsShop()
        .backyardBirdsDataContainer()
    }
  }
}
