//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The environment key that defines the preferred navigation style.

import SwiftUI

// MARK: - PrefersTabNavigationEnvironmentKey

struct PrefersTabNavigationEnvironmentKey: EnvironmentKey
{
  static var defaultValue = false
}

extension EnvironmentValues
{
  var prefersTabNavigation: Bool
  {
    get { self[PrefersTabNavigationEnvironmentKey.self] }
    set { self[PrefersTabNavigationEnvironmentKey.self] = newValue }
  }
}

#if os(iOS)
extension PrefersTabNavigationEnvironmentKey: UITraitBridgedEnvironmentKey
{
  static func read(from traitCollection: UITraitCollection) -> Bool
  {
    traitCollection.userInterfaceIdiom == .phone || traitCollection.userInterfaceIdiom == .tv
  }

  static func write(to mutableTraits: inout UIMutableTraits, value: Bool)
  {
    // Do not write.
  }
}
#endif
