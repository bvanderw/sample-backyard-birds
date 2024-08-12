//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// Identifiers for use in the store.

import SwiftUI

// MARK: - PassIdentifiers

public struct PassIdentifiers: Sendable
{
  public var group: String

  public var individual: String
  public var family: String
  public var premium: String
}

extension EnvironmentValues
{
  private enum PassIDsKey: EnvironmentKey
  {
    static var defaultValue = PassIdentifiers(
      group: "6F3A93AB",
      individual: "pass.individual",
      family: "pass.family",
      premium: "pass.premium"
    )
  }

  public var passIDs: PassIdentifiers
  {
    get { self[PassIDsKey.self] }
    set { self[PassIDsKey.self] = newValue }
  }
}
