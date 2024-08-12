//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The entry point for Backyard Birds.

import BackyardBirdsData
import SwiftData
import SwiftUI

@main
struct BackyardBirdsApp: App
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
