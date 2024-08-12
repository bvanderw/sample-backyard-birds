//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The bird search suggestions.

import BackyardBirdsData
import SwiftData
import SwiftUI

struct BirdsSearchSuggestions: View
{
  @Query private var birds: [Bird]

  var speciesNames: [String]
  {
    Set(birds.map(\.speciesName)).sorted()
  }

  var body: some View
  {
    ForEach(speciesNames, id: \.self)
    { speciesName in
      Text("**\(speciesName)**")
        .searchCompletion(speciesName)
    }
  }
}
