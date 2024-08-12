//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The plant summary row.

import BackyardBirdsData
import BackyardBirdsUI
import LayeredArtworkLibrary
import SwiftData
import SwiftUI

struct PlantSummaryRow: View
{
  var plant: Plant

  var body: some View
  {
    VStack
    {
      ComposedPlant(plant: plant)
        .padding(4)
        .padding(.bottom, -20)
        .clipShape(.circle)
        .background(.fill.tertiary, in: .circle)
        .padding(.horizontal, 10)

      VStack
      {
        Text(plant.speciesName)
          .font(.callout)
      }
      .multilineTextAlignment(.center)
    }
  }
}

#Preview
{
  ModelPreview
  { plant in
    PlantSummaryRow(plant: plant)
  }
}
