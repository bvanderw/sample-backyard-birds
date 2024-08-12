//
// See the LICENSE.txt file for this sample’s licensing information.
//
// Abstract:
// The model's container.

import SwiftData
import SwiftUI

// MARK: - BackyardBirdsDataContainerViewModifier

struct BackyardBirdsDataContainerViewModifier: ViewModifier
{
  let container: ModelContainer

  init(inMemory: Bool)
  {
    container = try! ModelContainer(for: DataGeneration.schema, configurations: [ModelConfiguration(isStoredInMemoryOnly: inMemory)])
  }

  func body(content: Content) -> some View
  {
    content
      .generateData()
      .modelContainer(container)
  }
}

// MARK: - GenerateDataViewModifier

struct GenerateDataViewModifier: ViewModifier
{
  @Environment(\.modelContext) private var modelContext

  func body(content: Content) -> some View
  {
    content.onAppear
    {
      DataGeneration.generateAllData(modelContext: modelContext)
    }
  }
}

extension View
{
  public func backyardBirdsDataContainer(inMemory: Bool = DataGenerationOptions.inMemoryPersistence) -> some View
  {
    modifier(BackyardBirdsDataContainerViewModifier(inMemory: inMemory))
  }
}

extension View
{
  fileprivate func generateData() -> some View
  {
    modifier(GenerateDataViewModifier())
  }
}
