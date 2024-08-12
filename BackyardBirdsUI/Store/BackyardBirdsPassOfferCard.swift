//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The Backyard Birds Pass offer card view.

import BackyardBirdsData
import LayeredArtworkLibrary
import SwiftData
import SwiftUI

// MARK: - BackyardBirdsPassOfferCard

struct BackyardBirdsPassOfferCard: View
{
  var body: some View
  {
    VStack(alignment: .center)
    {
      HStack
      {
        Text("Backyard Birds Pass")
        BirdDecoration()
      }
    }
    .frame(maxWidth: .infinity)
  }
}

private let tagValue = BirdTag.premiumGoldenHummingbird.rawValue

// MARK: - BirdDecoration

struct BirdDecoration: View
{
  @Query(filter: #Predicate<Bird> { $0.tag == tagValue })
  private var birds: [Bird]

  var body: some View
  {
    if let bird = birds.first
    {
      ComposedBird(bird: bird, direction: .leading)
        .frame(width: 50, height: 50)
    }
  }
}
