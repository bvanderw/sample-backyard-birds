//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The backyard widget intent.

import AppIntents
import BackyardBirdsData
import OSLog
import SwiftData
import WidgetKit

private let logger = Logger(subsystem: "Widgets", category: "BackyardWidgetIntent")

// MARK: - BackyardWidgetIntent

struct BackyardWidgetIntent: WidgetConfigurationIntent
{
  static let title: LocalizedStringResource = "Backyard"
  static let description = IntentDescription("Keep track of your backyards.")

  @Parameter(title: "Backyards", default: BackyardWidgetContent.all)
  var backyards: BackyardWidgetContent

  @Parameter(title: "Backyard")
  var specificBackyard: BackyardEntity?

  init(backyards: BackyardWidgetContent = .all, specificBackyard: BackyardEntity? = nil)
  {
    self.backyards = backyards
    self.specificBackyard = specificBackyard
  }

  init()
  {}

  static var parameterSummary: some ParameterSummary
  {
    When(\.$backyards, .equalTo, BackyardWidgetContent.specific)
    {
      Summary
      {
        \.$backyards
        \.$specificBackyard
      }
    } otherwise: {
      Summary
      {
        \.$backyards
      }
    }
  }
}

// MARK: - BackyardEntity

struct BackyardEntity: AppEntity, Identifiable, Hashable
{
  var id: Backyard.ID
  var name: String

  init(id: Backyard.ID, name: String)
  {
    self.id = id
    self.name = name
  }

  init(from backyard: Backyard)
  {
    id = backyard.id
    name = backyard.name
  }

  var displayRepresentation: DisplayRepresentation
  {
    DisplayRepresentation(title: "\(name)")
  }

  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Backyard")
  static var defaultQuery = BackyardEntityQuery()
}

// MARK: - BackyardEntityQuery

struct BackyardEntityQuery: EntityQuery, Sendable
{
  func entities(for identifiers: [BackyardEntity.ID]) async throws -> [BackyardEntity]
  {
    logger.info("Loading backyards for identifiers: \(identifiers)")
    let modelContext = ModelContext(DataGeneration.container)
    let backyards = try! modelContext.fetch(FetchDescriptor<Backyard>(predicate: #Predicate { identifiers.contains($0.id) }))
    logger.info("Found \(backyards.count) backyards")
    return backyards.map { BackyardEntity(from: $0) }
  }

  func suggestedEntities() async throws -> [BackyardEntity]
  {
    logger.info("Loading backyards to suggest for specific backyard...")
    let modelContext = ModelContext(DataGeneration.container)
    let backyards = try! modelContext.fetch(FetchDescriptor<Backyard>())
    logger.info("Found \(backyards.count) backyards")
    return backyards.map { BackyardEntity(from: $0) }
  }
}

// MARK: - BackyardWidgetContent

enum BackyardWidgetContent: String, AppEnum
{
  case all
  case favorites
  case specific

  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Backyard List")

  static let caseDisplayRepresentations: [BackyardWidgetContent: DisplayRepresentation] = [
    .all: DisplayRepresentation(title: LocalizedStringResource("All", comment: "A phrase that means all backyards should be shown in a widget.")),
    .favorites: DisplayRepresentation(title: LocalizedStringResource("Favorites",
                                                                     comment: "A phrase that means only favorite backyards should be shown in a widget.")),
    .specific: DisplayRepresentation(title: LocalizedStringResource("Specific",
                                                                    comment: "A phrase that means only a specific backyard should be shown in a widget."))
  ]
}
