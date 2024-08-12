//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The fountain.

import BackyardBirdsData
import SwiftUI

private let variants = [
  ImageResource.Fountain.terracotta, .Fountain.stone, .Fountain.marble
]

// MARK: - FountainArtwork

public struct FountainArtwork: View
{
  var variantIndex: Int

  public init(variant: Int)
  {
    variantIndex = variant
  }

  public var body: some View
  {
    Image(variants[variantIndex])
      .resizable()
      .scaledToFit()
  }
}
