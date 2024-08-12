//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The definition of the account.

import Foundation
import Observation
import OSLog
import SwiftData

private let logger = Logger(subsystem: "BackyardBirdsData", category: "Account")

// MARK: - Account

@Model public class Account
{
  @Attribute(.unique) public var id: String
  public var bird: Bird?
  public var joinDate: Date
  public var displayName: String
  public var emailAddress: String
  public var isPremiumMember: Bool

  public init(joinDate: Date, displayName: String, emailAddress: String, isPremiumMember: Bool)
  {
    id = UUID().uuidString
    self.joinDate = joinDate
    self.displayName = displayName
    self.emailAddress = emailAddress
    self.isPremiumMember = isPremiumMember
    logger.notice("User \(id) has been created with DisplayName: '\(self.displayName)' and is \(!self.isPremiumMember ? "not " : "")a premium user.")
  }
}
